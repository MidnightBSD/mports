#!/bin/sh
set -eu

dist=$1
output=$2
version=$3
src="$dist/src"
classpath="$dist/lib/*:$dist/lib/entitlement-bridge/*"

# Compile only the port patches. Keep the rest of the official JARs, including
# their module descriptors and version-specific implementations.
for module in entitlement native; do
    classes="$output/$module"
    mkdir -p "$classes"
    case "$module" in
    entitlement)
        package=entitlement
        directory=ent
        sources="bootstrap/HardcodedEntitlements.java runtime/policy/Platform.java
            runtime/policy/FileAccessTree.java runtime/policy/entitlements/FilesEntitlement.java"
        ;;
    native)
        package=nativeaccess
        directory=native
        sources="BsdNativeAccess.java NativeAccessHolder.java jdk/JdkBsdCLibrary.java
            jdk/JdkNativeLibraryProvider.java jdk/JdkPosixCLibrary.java
            lib/BsdCLibrary.java lib/NativeLibrary.java lib/LoaderHelper.java"
        ;;
    esac
    set --
    for file in $sources; do
        set -- "$@" "$src/$directory/org/elasticsearch/$package/$file"
    done
    "$JAVA_HOME/bin/javac" -J-XX:TieredStopAtLevel=1 \
        --enable-preview --release 21 -proc:none -implicit:none \
        -sourcepath '' -classpath "$classpath" -d "$classes" "$@"

    # Match build-tools-internal's MrjarPlugin.maybeStripPreview: clear the
    # class-file minor version (FFFF for preview APIs, otherwise already zero).
    # Upstream supplies the Java 22+ FFM adaptations in the preserved MR entries.
    find "$classes" -name '*.class' > "$output/$module.list"
    while IFS= read -r file; do
        printf '\000\000' | dd of="$file" bs=1 seek=4 conv=notrunc 2>/dev/null
    done < "$output/$module.list"

    jar="elasticsearch-$module-$version.jar"
    "$JAVA_HOME/bin/jar" --update --file "$dist/lib/$jar" -C "$classes" .
    if [ "$module" = entitlement ]; then
        "$JAVA_HOME/bin/jar" --update --file "$dist/lib/tools/plugin-cli/$jar" -C "$classes" .
    fi
done
