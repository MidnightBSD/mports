require 'jruby'
require 'ffi'
require 'libfixposix'

os_name = java.lang.System.getProperty('os.name')
raise 'OS property changed' unless os_name == IO.popen(['/usr/bin/uname', '-s'], &:read).strip
raise 'Native POSIX unavailable' unless JRuby.runtime.posix.is_native
raise 'Wrong FFI ABI' unless FFI::Platform::NAME == "#{FFI::Platform::ARCH}-freebsd12"

module ProbeLibc
  extend FFI::Library
  ffi_lib FFI::Platform::LIBC
  attach_function :getpid, [], :int
  attach_function :getuid, [], :uint
end
raise 'FFI getpid mismatch' unless ProbeLibc.getpid == Process.pid
raise 'FFI getuid mismatch' unless ProbeLibc.getuid == Process.uid

abi_text = IO.popen([ARGV.fetch(0)], &:read)
raise 'C ABI probe failed' unless $?.success?
abi = abi_text.split.to_h { |entry| key, value = entry.split('='); [key, Integer(value)] }
layout_field = Java::JnrPosix::FreeBSDFileStat12.java_class.declared_field('layout')
layout_field.accessible = true
layout = layout_field.value(nil)
raise 'Wrong stat allocation size' unless layout.size == abi.fetch('size')
{'st_dev' => 'dev', 'st_ino' => 'ino', 'st_nlink' => 'nlink',
 'st_mode' => 'mode', 'st_rdev' => 'rdev', 'st_size' => 'sizeoff',
 'st_blocks' => 'blocks', 'st_spare0' => 'spare'}.each do |name, c_name|
  field = layout.java_class.declared_field(name)
  field.accessible = true
  raise "Wrong #{name} offset" unless field.value(layout).offset == abi.fetch(c_name)
end

stat = File.stat('/usr/bin/true')
observed = [stat.size, stat.mode.to_s(8), stat.uid, stat.gid,
            stat.ino, stat.nlink, stat.mtime.to_i, stat.blocks].map(&:to_s)
expected = IO.popen(['/usr/bin/stat', '-f', '%z %p %u %g %i %l %m %b', '/usr/bin/true'], &:read).strip.split
raise 'External stat probe failed' unless $?.success?
raise "stat ABI mismatch: #{observed.inspect} != #{expected.inspect}" unless observed == expected

child = Process.spawn('/usr/bin/true')
Process.wait(child)
raise 'Spawn child failed' unless $?.success?
puts "PASS: #{os_name}, native POSIX, FFI libc, stat ABI size=#{layout.size}, libfixposix #{LFP::SO_VERSION}, spawn/wait"
