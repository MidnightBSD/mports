# $MidnightBSD$

PORTNAME=	slim
PORTVERSION=	1.3.6
PORTREVISION=	4
CATEGORIES=	x11
MASTER_SITES=	ftp://ftp.berlios.de/pub/slim/ \
		SF/slim.berlios

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Graphical login manager for X11, derived from Login.app

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:devel/libpthread-stubs
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libpng.so:graphics/png \
		libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

USES=		cmake jpeg pkgconfig
USE_XORG=	ice sm x11 xau xcb xdmcp xext xft xmu xorg-server xrandr \
		xrender xt
USE_RC_SUBR=	slim
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_SLIMLOCK=no \
	-DBUILD_SHARED_LIBS=yes

OPTIONS_DEFINE=		PAM UTF8 CONSOLEKIT
OPTIONS_DEFAULT=	PAM CONSOLEKIT
OPTIONS_SUB=	yes

UTF8_DESC=	Support UTF-8 characters
CONSOLEKIT_DESC=Enable support for consolekit

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPAM}
CMAKE_ARGS+=	-DUSE_PAM=yes
PLIST_SUB+=	PAM=""
.else
CMAKE_ARGS+=	-DUSE_PAM=no
PLIST_SUB+=	PAM="@comment "
.endif

.if ${PORT_OPTIONS:MUTF8}
# patch taken from slim-unicode in Arch User Repository
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-utf8
.endif

CONSOLEKIT_CMAKE_ON=    -DUSE_CONSOLEKIT=yes
CONSOLEKIT_LIB_DEPENDS= libck-connector.so:sysutils/consolekit2
CONSOLEKIT_CMAKE_OFF=   -DUSE_CONSOLEKIT=no

post-patch:
	@${CP} ${WRKSRC}/slim.conf ${WRKSRC}/slim.conf.sample
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/slim.conf.sample
	@${REINPLACE_CMD} -e 's,%%PREFIX%%,${PREFIX},' \
		${WRKSRC}/slim.1

post-install:
	${CP} ${FILESDIR}/background.jpg ${PREFIX}/share/slim/themes/default/background.jpg

.	if ${PORT_OPTIONS:MPAM}
	${INSTALL_DATA} ${FILESDIR}/pam.conf ${STAGEDIR}${PREFIX}/etc/pam.d/slim.default
.	endif

.include <bsd.port.mk>
