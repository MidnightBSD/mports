# $MidnightBSD$

PORTNAME=	mlogind
PORTVERSION=	1.3.7
PORTREVISION=	0
CATEGORIES=	x11

MAINTAINER=	ports@midnightbsd.org
COMMENT=	MidnightBSD Graphical login manager for X11

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

LIB_DEPENDS=	libdbus-1.so:${PORTSDIR}/devel/dbus \
		libpthread-stubs.so:${PORTSDIR}/devel/libpthread-stubs \
		libpng.so:${PORTSDIR}/graphics/png \
		libfreetype.so:${PORTSDIR}/print/freetype2 \
		libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig

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
SUB_FILES=	pkg-message

CMAKE_ARGS=	-DUSE_CONSOLEKIT=yes \
	-DBUILD_SLIMLOCK=no \
	-DBUILD_SHARED_LIBS=yes

OPTIONS_DEFINE=		PAM UTF8 CONSOLEKIT
OPTIONS_DEFAULT=	PAM CONSOLEKIT
OPTIONS_SUB=	yes

UTF8_DESC=	Support UTF-8 characters
CONSOLEKIT_DESC=Enable support for consolekit

PLIST_SUB+=	VERSION="${PORTVERSION}"

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

.if ${PORT_OPTIONS:MCONSOLEKIT}
CMAKE_ARGS+=	-DUSE_CONSOLEKIT=yes
LIB_DEPENDS+=	libck-connector.so:${PORTSDIR}/sysutils/consolekit
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
.	if ${PORT_OPTIONS:MPAM}
	${INSTALL_DATA} ${FILESDIR}/pam.conf ${STAGEDIR}${PREFIX}/etc/pam.d/mlogind.default
.	endif

.include <bsd.port.mk>
