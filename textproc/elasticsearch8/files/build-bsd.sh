#!/bin/sh
set -eu

dist=$1
output=$2
version=$3
src="$dist/src"
classpath="$dist/lib/*:$dist/lib/entitlement-bridge/*"

# ES 8 keeps its Java 21 FFM bindings in a multi-release overlay. Rebuild the
# Java 17 base classes first, then compile the overlay against that updated JAR.
for module in entitlement native native21; do
    classes="$output/$module"
    destination="$classes"
    release=17
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
        sources="BsdNativeAccess.java NativeAccessHolder.java
            lib/BsdCLibrary.java lib/NativeLibrary.java lib/LoaderHelper.java"
        ;;
    native21)
        package=nativeaccess
        directory=native21
        release=21
        destination="$classes/META-INF/versions/21"
        sources="jdk/JdkBsdCLibrary.java jdk/JdkNativeLibraryProvider.java jdk/JdkPosixCLibrary.java"
        mkdir -p "$destination"
        ;;
    esac
    set --
    if [ "$release" = 21 ]; then
        set -- --enable-preview
    fi
    set -- "$@" --release "$release" -proc:none -implicit:none \
        -sourcepath '' -classpath "$classpath" -d "$destination"
    for file in $sources; do
        set -- "$@" "$src/$directory/org/elasticsearch/$package/$file"
    done
    "$JAVA_HOME/bin/javac" -J-XX:TieredStopAtLevel=1 "$@"

    # Match upstream MrjarPlugin.maybeStripPreview, preserving the Java 22+
    # implementations already present in the original JAR.
    if [ "$release" = 21 ]; then
        find "$destination" -name '*.class' > "$output/$module.list"
        while IFS= read -r file; do
            printf '\000\000' | dd of="$file" bs=1 seek=4 conv=notrunc 2>/dev/null
        done < "$output/$module.list"
    fi

    target=native
    if [ "$module" = entitlement ]; then target=entitlement; fi
    jar="elasticsearch-$target-$version.jar"
    "$JAVA_HOME/bin/jar" -J-XX:TieredStopAtLevel=1 --update --file "$dist/lib/$jar" -C "$classes" .
    if [ "$module" = entitlement ]; then
        "$JAVA_HOME/bin/jar" -J-XX:TieredStopAtLevel=1 --update --file "$dist/lib/tools/plugin-cli/$jar" -C "$classes" .
    fi
done
