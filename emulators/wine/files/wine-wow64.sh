#!/bin/sh -e

TARGET="$(realpath "$0")"
PREFIX="${TARGET%/*/*}"
LOCALBASE="${PREFIX}"

I386_ROOT="${WINE_i386_ROOT:-$HOME/.i386-wine-pkg}"

if [ ! -f "$I386_ROOT/$PREFIX/bin/wine" ]
then
  # No 32-bit Wine: run the 64-bit loader so 64-bit programs still work.
  # WINESERVER must be unset, otherwise the loader derives this script as
  # its 32-bit loader again; without it, the loader falls back to the
  # 64-bit one.  Only warn when invoked by the user, not by the loader.
  if [ -z "$WINELOADERNOEXEC" ]
  then
    printf "%s doesn't exist; running 64-bit Wine only.\n" "$I386_ROOT/$PREFIX/bin/wine" >&2
    printf "32-bit Windows programs will not work.  Set WINE_i386_ROOT if 32-bit Wine is installed elsewhere.\n" >&2
  fi
  unset WINESERVER
  exec "${TARGET}64.bin" "$@"
fi

WINE32_VERSION=$(env -u WINELOADERNOEXEC "$I386_ROOT/$PREFIX/bin/wine" --version)
WINE64_VERSION=$(env -u WINELOADERNOEXEC "${TARGET}64" --version)
if [ "$WINE32_VERSION" != "$WINE64_VERSION" ]
then
  printf "wine [%s] and wine64 [%s] versions do not match!\n\n" "$WINE32_VERSION" "$WINE64_VERSION"
  printf "Try updating 32-bit wine with\n\t%s\n" "$PREFIX/share/wine/pkg32.sh upgrade"
  exit 1
fi

export LIBGL_DRIVERS_PATH="${LIBGL_DRIVERS_PATH:+$LIBGL_DRIVERS_PATH:}$LOCALBASE/lib/dri-devel:$LOCALBASE/lib32/dri-devel:$I386_ROOT/$LOCALBASE/lib/dri-devel:$LOCALBASE/lib/dri:$LOCALBASE/lib32/dri:$I386_ROOT/$LOCALBASE/lib/dri"
export LD_32_LIBRARY_PATH="${LD_32_LIBRARY_PATH:+$LD_32_LIBRARY_PATH:}$I386_ROOT/$PREFIX/lib/wine:$LOCALBASE/lib32:$I386_ROOT/$LOCALBASE/lib"
for d in "$I386_ROOT/$LOCALBASE"/llvm*/lib
do
  if [ -d "$d" ]
  then
    export LD_32_LIBRARY_PATH="$LD_32_LIBRARY_PATH:$d"
  fi
done
export LD_32_LIBRARY_PATH_RPATH=y
LD_32_LIBMAP_CONF=$(sed "s,$LOCALBASE,$I386_ROOT&,2" "$I386_ROOT/$LOCALBASE"/etc/libmap.d/*.conf 2>/dev/null || true)
export LD_32_LIBMAP="
libgcc_s.so.1 /usr/lib32/libgcc_s.so.1
$LOCALBASE/lib/libvulkan_intel.so  $I386_ROOT/$LOCALBASE/lib/libvulkan_intel.so
$LOCALBASE/lib/libvulkan_radeon.so $I386_ROOT/$LOCALBASE/lib/libvulkan_radeon.so
$LOCALBASE/lib/alsa-lib/libasound_module_pcm_oss.so $I386_ROOT/$LOCALBASE/lib/alsa-lib/libasound_module_pcm_oss.so
$LD_32_LIBMAP_CONF
$LD_32_LIBMAP"

if [ -z "$WINE_NO_WOW64" ]
then
  export WINESERVER="${TARGET}server"
fi

exec "$I386_ROOT/$PREFIX/bin/wine" "$@"
