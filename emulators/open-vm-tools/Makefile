# Created by: mbr@FreeBSD.org

PORTNAME=	open-vm-tools
PORTVERSION=	${RELEASE_VER}
DISTVERSIONPREFIX=	stable-
PORTEPOCH=	2
CATEGORIES=	emulators

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Open VMware tools for MidnightBSD VMware guests

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386

LIB_DEPENDS=	libmspack.so:archivers/libmspack \
		libdnet.so:net/libdnet

RELEASE_VER=	11.1.0
BUILD_VER=	16036546

FLAVORS=			default nox11
default_CONFLICTS_INSTALL=	open-vm-tools-nox11
nox11_PKGNAMESUFFIX=		-nox11
nox11_CONFLICTS_INSTALL=	open-vm-tools
nox11_COMMENT=			(without X11)

OPTIONS_DEFINE=		DOCS LIBNOTIFY OPENSSL X11
OPTIONS_DEFAULT=	DOCS LIBNOTIFY OPENSSL X11

OPTIONS_SUB=

DOCS_BUILD_DEPENDS=	doxygen:devel/doxygen
DOCS_CONFIGURE=		docs
LIBNOTIFY_DESC=		Desktop notification support

X11_CONFIGURE_WITH=	x gtk2 gtkmm
X11_USES=		gnome xorg
X11_USE=		xorg=ice,sm,x11,xext,xi,xinerama,xorgproto,xrandr,xrender,xtst \
			gnome=gdkpixbuf2,gtk20,gtkmm24
X11_LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
			libfreetype.so:print/freetype2
LIBNOTIFY_LIB_DEPENDS=	libnotify.so:devel/libnotify
OPENSSL_CONFIGURE_WITH=	ssl

WRKSRC_SUBDIR=		open-vm-tools

CONFIGURE_TARGET=	${ARCH}-portbld-midnightbsd${OSREL}
CONFIGURE_ARGS+=	--host=${ARCH}-portbld-midnightbsd${OSREL}
GNU_CONFIGURE=		yes
USES=			autoreconf fuse gettext-runtime kmod libtool localbase pathfix pkgconfig gnome
USE_GNOME=		glib20

USE_GITHUB=		yes
GH_ACCOUNT=		vmware

USE_LDCONFIG=		yes
CPPFLAGS+=		-Wno-deprecated-declarations

SSP_UNSAFE=		kernel module does not support ssp

CONFIGURE_ARGS+=	--without-icu \
			--disable-vgauth \
			--sysconfdir=${PREFIX}/etc

USE_RC_SUBR=		vmware-guestd vmware-kmod

INSTALL_TARGET=		install-strip

.include <bsd.mport.options.mk>


CFLAGS+=		-Wno-unknown-warning-option


CONFIGURE_ENV+=		SYSDIR=${SRC_BASE}/sys

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e "s@%%PREFIX%%@${PREFIX}@"\
		 ${WRKSRC}/lib/guestApp/guestApp.c
	${LN} -sf ${WRKSRC}/scripts/freebsd ${WRKSRC}/scripts/midnightbsd
	${LN} -sf ${WRKSRC}/modules/freebsd ${WRKSRC}/modules/midnightbsd

post-build:
	cd ${WRKSRC}/modules && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_ARGS} ${FAKE_MAKEARGS}

post-install:
	${MKDIR} ${PREFIX}/lib/vmware-tools/modules/drivers
	${MKDIR} ${PREFIX}/lib/vmware-tools/modules/input
	${INSTALL_DATA} ${WRKSRC}/modules/midnightbsd/vmblock.ko ${PREFIX}/lib/vmware-tools/modules/drivers/vmblock.ko
	${INSTALL_DATA} ${WRKSRC}/modules/midnightbsd/vmmemctl.ko ${PREFIX}/lib/vmware-tools/modules/drivers/vmmemctl.ko
	${MKDIR} ${PREFIX}/share/open-vm-tools/scripts/vmware/
	${MKDIR} ${PREFIX}/share/open-vm-tools/scripts/
	${MKDIR} ${PREFIX}/share/open-vm-tools/tests/
	${MKDIR} ${PREFIX}/etc/rc.conf.d
	${MKDIR} ${PREFIX}/etc/pam.d
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/linux/pam.d/vmtoolsd ${PREFIX}/etc/pam.d/vmtoolsd

.include <bsd.port.post.mk>
