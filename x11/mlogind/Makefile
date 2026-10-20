PORTNAME=	mlogind
PORTVERSION=	1.4.2
DISTVERSIONPREFIX=	v
CATEGORIES=	x11

MAINTAINER=	ports@midnightbsd.org
COMMENT=	MidnightBSD Graphical login manager for X11
WWW=		https://github.com/MidnightBSD/mlogind

LICENSE=	gpl2

#WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:devel/libpthread-stubs
LIB_DEPENDS=	libpng.so:graphics/png \
		libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

USES=		cmake compiler:c++11-lang cpe gnome jpeg pkgconfig xorg
USE_GITHUB=	yes
GH_PROJECT=	mlogind
GH_ACCOUNT=	midnightbsd
USE_GNOME=	librsvg2
USE_XORG=	ice sm x11 xau xcb xdmcp xext xft xmu xorg-server xrandr \
		xrender xt
USE_RC_SUBR=	mlogind
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_MLOGINLOCK=no \
	-DBUILD_SHARED_LIBS=yes \
	-DUSE_RSVG=yes

OPTIONS_DEFINE=		CONSOLEKIT
OPTIONS_DEFAULT=	CONSOLEKIT
OPTIONS_SUB=	yes

CONSOLEKIT_DESC=Enable support for consolekit

.include <bsd.mport.options.mk>

CMAKE_ARGS+=	-DUSE_PAM=yes

.if ${PORT_OPTIONS:MCONSOLEKIT}
CMAKE_ARGS+=	-DUSE_CONSOLEKIT=yes
LIB_DEPENDS+=	libdbus-1.so:devel/dbus \
		libck-connector.so:sysutils/consolekit2
.else
CMAKE_ARGS+=	-DUSE_CONSOLEKIT=no
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/mlogind.conf.sample
	@${REINPLACE_CMD} -e 's,%%PREFIX%%,${PREFIX},' \
		${WRKSRC}/mlogind.1

post-install:
	${INSTALL_DATA} ${FILESDIR}/pam.conf ${PREFIX}/etc/pam.d/mlogind.sample

.include <bsd.port.mk>
