import org.elasticsearch.entitlement.runtime.policy.Platform;
import org.elasticsearch.entitlement.runtime.policy.FileAccessTree;
import org.elasticsearch.entitlement.runtime.policy.PathLookup;
import org.elasticsearch.entitlement.runtime.policy.entitlements.FilesEntitlement;
import org.elasticsearch.nativeaccess.NativeAccess;
import org.elasticsearch.nativeaccess.ProcessLimits;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;

class BsdNativeTests {
    public static void main(String[] args) throws Exception {
        org.elasticsearch.common.logging.LogConfigurator.configureESLogging();
        org.elasticsearch.common.logging.LogConfigurator.configureWithoutConfig(org.elasticsearch.common.settings.Settings.EMPTY);
        if (!Platform.BSD.isCurrent()) throw new AssertionError("BSD entitlement platform not selected");
        PathLookup lookup = new PathLookup() {
            public java.nio.file.Path pidFile() { return null; }
            public java.util.stream.Stream<java.nio.file.Path> getBaseDirPaths(BaseDir baseDir) {
                return java.util.stream.Stream.empty();
            }
            public java.util.stream.Stream<java.nio.file.Path> resolveSettingPaths(BaseDir baseDir, String setting) {
                return java.util.stream.Stream.empty();
            }
            public boolean isPathOnDefaultFilesystem(java.nio.file.Path path) {
                return path.getFileSystem().equals(java.nio.file.FileSystems.getDefault());
            }
        };
        var allowed = java.nio.file.Path.of(System.getProperty("java.io.tmpdir"), "ElasticBSDAllowed").toAbsolutePath();
        var tree = FileAccessTree.withoutExclusivePaths(
            new FilesEntitlement(java.util.List.of(
                FilesEntitlement.FileData.ofPath(allowed, FilesEntitlement.Mode.READ).withPlatform(Platform.BSD)
            )), lookup, java.util.List.of(), java.util.List.of()
        );
        if (!tree.canRead(allowed) || tree.canWrite(allowed) || tree.canRead(allowed.resolveSibling("elasticbsdallowed"))) {
            throw new AssertionError("BSD file entitlements must enforce read-only access and distinguish case");
        }
        NativeAccess access = NativeAccess.instance();
        if (NativeAccess.onPosixReturn(nativeAccess -> true).orElse(false) == false) {
            throw new AssertionError("Native POSIX provider unavailable");
        }
        ProcessLimits limits = access.getProcessLimits();
        if (limits.maxThreads() <= 0 || limits.maxVirtualMemorySize() <= 0 || limits.maxFileSize() <= 0) {
            throw new AssertionError("Invalid native resource limits: " + limits);
        }
        byte[] input = new byte[8192];
        for (int i = 0; i < input.length; i++) input[i] = (byte)(i % 127);
        var zstd = access.getZstd();
        try (var source = access.newConfinedBuffer(input.length);
             var compressed = access.newConfinedBuffer(zstd.compressBound(input.length));
             var decoded = access.newConfinedBuffer(input.length)) {
            source.buffer().put(input).flip();
            int compressedSize = zstd.compress(compressed, source, 3);
            compressed.buffer().limit(compressedSize);
            int decodedSize = zstd.decompress(decoded, compressed);
            byte[] result = new byte[decodedSize];
            decoded.buffer().get(result);
            if (!Arrays.equals(input, result)) throw new AssertionError("zstd round trip failed");
        }
        var dir = Files.createTempDirectory("elasticsearch-bsd-native-");
        var file = dir.resolve("sparse");
        var reference = dir.resolve("reference");
        try {
            for (var path : new java.nio.file.Path[]{file, reference}) {
                try (var channel = FileChannel.open(path, StandardOpenOption.CREATE_NEW, StandardOpenOption.WRITE)) {
                    channel.position(16 * 1024 * 1024);
                    channel.write(ByteBuffer.wrap(new byte[]{1}));
                }
            }
            var stat = new ProcessBuilder("/usr/bin/stat", "-f", "%b", file.toString()).start();
            long blocks = Long.parseLong(new String(stat.getInputStream().readAllBytes()).trim());
            if (stat.waitFor() != 0) throw new AssertionError("stat failed");
            long allocated = access.allocatedSizeInBytes(file).orElseThrow();
            if (allocated != blocks * 512) throw new AssertionError("Incorrect allocated size: " + allocated);
            var probe = new ProcessBuilder(args[0], reference.toString(), "33554432").start();
            String[] result = new String(probe.getInputStream().readAllBytes()).trim().split(" ");
            if (probe.waitFor() != 0 || result.length != 2) throw new AssertionError("C preallocation probe failed");
            int error = Integer.parseInt(result[0]);
            long expectedSize = Long.parseLong(result[1]);
            if (error == 0 && expectedSize != 32 * 1024 * 1024) throw new AssertionError("C preallocation size mismatch");
            access.tryPreallocate(file, 32 * 1024 * 1024);
            if (Files.size(file) != expectedSize) throw new AssertionError("Preallocation differs from C result");
            try (var channel = FileChannel.open(file, StandardOpenOption.READ)) {
                channel.position(16 * 1024 * 1024);
                var marker = ByteBuffer.allocate(1);
                if (channel.read(marker) != 1 || marker.get(0) != 1) throw new AssertionError("Preallocation changed existing data");
            }
            System.out.println("PASS: native preallocation matches C result (error=" + error + ")");
        } finally {
            Files.deleteIfExists(file);
            Files.deleteIfExists(reference);
            Files.delete(dir);
        }
        System.out.println("PASS: BSD entitlements, native limits, zstd, stat and preallocation");
        if (!access.definitelyRunningAsRoot()) {
            // Start jspawnhelper before applying the process limit, then prove
            // that a subsequent child cannot be created by this non-root JVM.
            var child = new ProcessBuilder("/usr/bin/true").start();
            if (child.waitFor() != 0) throw new AssertionError("Baseline child failed");
            access.tryInstallExecSandbox();
            if (access.getExecSandboxState() != NativeAccess.ExecSandboxState.ALL_THREADS) {
                throw new AssertionError("BSD sandbox unavailable");
            }
            try {
                var forbidden = new ProcessBuilder("/usr/bin/true").start();
                forbidden.waitFor();
                throw new AssertionError("BSD sandbox allowed child process creation");
            } catch (IOException expected) {
                System.out.println("PASS: BSD sandbox blocks child process creation");
            }
        }
    }
}
