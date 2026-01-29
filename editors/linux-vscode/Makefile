PORTNAME=	vscode
PORTVERSION=	1.105.0
CATEGORIES=	editors linux
MASTER_SITES=	https://update.code.visualstudio.com/latest/linux-x64/
PKGNAMEPREFIX=	linux-
PKGNAMESUFFIX=	3
DISTFILES=	stable

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft visual studio code editor
WWW=		https://code.visualstudio.com

LICENSE=	mit

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Upstream only supports amd64

SKIP_FAKE_ALL=  yes

USES=		desktop-file-utils gnome linux:rl9 ssl tar:bzip2
INSTALLS_ICONS=	yes
USE_LINUX=	brotli ca-certificates cairo cairo-gobject cups-libs curl \
                dbuslibs devtools dri elfutils-libelf elfutils-libs expat \
                fontconfig freetype fribidi gdkpixbuf2 gnupg gnutls \
                harfbuzz icu \
                imageformats-libs libassuan libasyncns libdrm libepoxy libevent \
                libgcrypt libglvnd libgpg-error libidn2 libksba libnghttp2 \
                libpciaccess libpsl librsvg2 libsecret libsigc++20 \
                libsndfile libsoup libssh libstemmer libtasn1 libthai libtheora libtool-ltdl \
                libtracker-sparql libunistring libusb libv4l libva libvdpau \
                libxkbcommon libxml2 libxslt llvm \
                lz4 nettle npth nspr nss ocl-icd orc \
                p11-kit pango pixman python3 \
                sqlite3 strace systemd-libs tcp_wrappers-libs vulkan \
                wayland wget xcb-util xorglibs

USE_LINUX_PREFIX=yes

NO_BUILD=	yes

do-install:
	${MKDIR} ${LINUXBASE}/opt
	${MV} ${WRKDIR}/VSCode-linux-x64 ${LINUXBASE}/opt/vscode

.include <bsd.port.mk>
