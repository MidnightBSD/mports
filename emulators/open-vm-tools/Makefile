# Created by: mbr@FreeBSD.org

PORTNAME=	open-vm-tools
PORTVERSION=	11.3.5
DISTVERSIONPREFIX=	stable-
PORTEPOCH=	2
CATEGORIES=	emulators

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Open VMware tools for MidnightBSD VMware guests

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386

LIB_DEPENDS=	libdnet.so:net/libdnet \
		libmspack.so:archivers/libmspack

FLAVORS=			default nox11
default_CONFLICTS_INSTALL=	open-vm-tools-nox11
nox11_PKGNAMESUFFIX=		-nox11
nox11_CONFLICTS_INSTALL=	open-vm-tools
nox11_COMMENT=			(without X11)

USES=		autoreconf gettext-runtime gnome kmod libtool localbase \
		pathfix pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	vmware
USE_GNOME=	glib20
USE_LDCONFIG=	yes
USE_RC_SUBR=	vmware-guestd vmware-kmod

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS FUSE LIBNOTIFY OPENSSL X11
OPTIONS_DEFAULT=DOCS FUSE LIBNOTIFY OPENSSL X11
.if ${FLAVOR:U} == nox11
OPTIONS_EXCLUDE:=	LIBNOTIFY X11
.endif
OPTIONS_SUB=

LIBNOTIFY_DESC=		Desktop notification support

DOCS_BUILD_DEPENDS=	doxygen:devel/doxygen
DOCS_CONFIGURE_ENABLE=	docs
FUSE_USES=		fuse
LIBNOTIFY_LIB_DEPENDS=	libnotify.so:devel/libnotify
OPENSSL_CONFIGURE_WITH=	ssl
X11_LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
			libfreetype.so:print/freetype2
X11_USES=		xorg
X11_USE=		GNOME=gdkpixbuf2,gtk30,gtkmm30 \
			XORG=ice,sm,x11,xext,xi,xinerama,xorgproto,xrandr,xrender,xtst
X11_CONFIGURE_WITH=	gtk3 gtkmm3 x

CPPFLAGS+=	-Wno-deprecated-declarations

SSP_UNSAFE=	kernel module does not support ssp

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-midnightbsd${OSREL}
CONFIGURE_ARGS+=	--host=${ARCH}-portbld-midnightbsd${OSREL}
CONFIGURE_ARGS+=	--without-icu \
			--disable-vgauth \
			--sysconfdir=${PREFIX}/etc

WRKSRC_SUBDIR=          open-vm-tools

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
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/tools.conf \
		${DATADIR}/tools.conf.sample
	${MKDIR} ${PREFIX}/share/open-vm-tools/scripts/vmware/
	${MKDIR} ${PREFIX}/share/open-vm-tools/scripts/
	${MKDIR} ${PREFIX}/share/open-vm-tools/tests/
	${MKDIR} ${PREFIX}/etc/rc.conf.d
	${CP} ${FAKE_DESTDIR}/etc/pam.d/vmtoolsd ${PREFIX}/etc/pam.d/

.include <bsd.port.post.mk>
