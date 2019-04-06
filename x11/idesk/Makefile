# $MidnightBSD$

PORTNAME=	idesk
PORTVERSION=	0.7.5
PORTREVISION=	7
CATEGORIES=	x11
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Place launch icons and background directly on your desktop

LICENSE=	bsd3

LIB_DEPENDS=	libXft.so:x11-fonts/libXft \
		libImlib2.so:graphics/imlib2

USES=		gmake pkgconfig tar:bzip2
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf

OPTIONS_DEFINE=	SHAPE SN
SHAPE_DESC=	Support of XShape extension
SN_DESC=	Startup notification support
OPTIONS_DEFAULT=	SHAPE

.include <bsd.port.pre.mk>

CXXFLAGS+=	`imlib2-config --cflags` `freetype-config --cflags`
MAKE_ARGS=	cc="${CXX}" cflags="${CXXFLAGS}"
SUB_FILES=	pkg-message
PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSHAPE}
CONFIGURE_ARGS+=	--enable-shape
.else
CONFIGURE_ARGS+=	--disable-shape
.endif

.if ${PORT_OPTIONS:MSN}
LIB_DEPENDS+=	libstartup-notification.so:x11/startup-notification
CONFIGURE_ARGS+=	--enable-libsn
.endif

do-install:
		${INSTALL_PROGRAM} ${WRKSRC}/src/idesk ${PREFIX}/bin
.if ${PORT_OPTIONS:MDOCS}
		${MKDIR} ${DOCSDIR}
		${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
