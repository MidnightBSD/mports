# $MidnightBSD: mports/graphics/gnash/Makefile,v 1.4 2009/03/15 19:00:33 laffer1 Exp $

PORTNAME=	gnash
PORTVERSION=	0.8.4
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Flash movie player
LICENSE=	gpl2

LIB_DEPENDS=	boost_thread.4:${PORTSDIR}/devel/boost \
		png.5:${PORTSDIR}/graphics/png \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		ungif.5:${PORTSDIR}/graphics/libungif \
		ogg.5:${PORTSDIR}/audio/libogg \
		gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_GL=		yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehier glib20 pkgconfig libxml2
WANT_GSTREAMER=	yes
USE_SDL=	sdl mixer
USE_GCC=	4.2+
USE_XORG=	x11 xau xdmcp xext xi xinerama ice sm

PLUGIN_DIR=	${PREFIX}/lib/browser_plugins

CONFIGURE_ENV=	LDFLAGS="${LDFLAGS} -Wl,--rpath,${PREFIX}/lib/gnash" \
		CFLAGS="-I${LOCALBASE}/include ${CFLAGS}"

CONFIGURE_ARGS=	--libdir="${PREFIX}/lib/gnash" \
		--with-plugindir=${PLUGIN_DIR} \
		--with-boost-incl="${LOCALBASE}/include" \
		--with-boost-lib="${LOCALBASE}/lib" \
		--disable-kparts \
		--enable-renderer=ogl

OPTIONS=	PLUGIN	"Enable firefox plugin" on

.include <bsd.port.pre.mk>

.if !defined(WITH_PLUGIN)
CONFIGURE_ARGS+=	--disable-plugin
PLIST_SUB+=	PLUGIN="@comment "
.else
USE_GNOME+=	atk pango gtk20
LIB_DEPENDS+=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext
PLIST_SUB+=	PLUGIN=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|gnash-dbg.log|.gnash-dbg.log|' ${WRKSRC}/libbase/log.h
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g;s|/usr/X11R6|${X11BASE}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure
.if !defined(WITH_PLUGIN)
	@${REINPLACE_CMD} -e '/STD_DIRS/ s|plugin||' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.post.mk>
