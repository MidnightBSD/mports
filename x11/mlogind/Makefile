PORTNAME=	mlogind
PORTVERSION=	1.3.8
CATEGORIES=	x11

MAINTAINER=	ports@midnightbsd.org
COMMENT=	MidnightBSD Graphical login manager for X11

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:devel/libpthread-stubs
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libpng.so:graphics/png \
		libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

USES=		cmake jpeg pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     mlogind
GH_ACCOUNT=     laffer1
GH_TAGNAME=     v${PORTVERSION}
GH_COMMIT=      1a73336
USE_XORG=	ice sm x11 xau xcb xdmcp xext xft xmu xorg-server xrandr \
		xrender xt
USE_RC_SUBR=	mlogind
USE_LDCONFIG=	yes

CMAKE_ARGS= -DBUILD_SLIMLOCK=no \
	-DBUILD_SHARED_LIBS=yes

OPTIONS_DEFINE=		UTF8 CONSOLEKIT
OPTIONS_DEFAULT=	CONSOLEKIT
OPTIONS_SUB=	yes

UTF8_DESC=	Support UTF-8 characters
CONSOLEKIT_DESC=Enable support for consolekit

.include <bsd.mport.options.mk>

CMAKE_ARGS+=	-DUSE_PAM=yes

.if ${PORT_OPTIONS:MUTF8}
# patch taken from slim-unicode in Arch User Repository
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-utf8
.endif

.if ${PORT_OPTIONS:MCONSOLEKIT}
CMAKE_ARGS+=	-DUSE_CONSOLEKIT=yes
LIB_DEPENDS+=	libck-connector.so:sysutils/consolekit2
.else
CMAKE_ARGS+=	-DUSE_CONSOLEKIT=no
.endif

post-patch:
	@${CP} ${WRKSRC}/mlogind.conf ${WRKSRC}/mlogind.conf.sample
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/mlogind.conf.sample
	@${REINPLACE_CMD} -e 's,%%PREFIX%%,${PREFIX},' \
		${WRKSRC}/mlogind.1

post-install:
	${INSTALL_DATA} ${FILESDIR}/pam.conf ${PREFIX}/etc/pam.d/mlogind.sample

.include <bsd.port.mk>
