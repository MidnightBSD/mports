PORTNAME=	idesk
PORTVERSION=	0.7.5
PORTREVISION=	8
CATEGORIES=	x11
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Place launch icons and background directly on your desktop
WWW=		https://idesk.sourceforge.net

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libImlib2.so:graphics/imlib2 \
		libXft.so:x11-fonts/libXft

USES=		gmake pkgconfig tar:bzip2 xorg
USE_XORG=	ice sm x11

GNU_CONFIGURE=	yes

MAKE_ARGS=	cc="${CXX}" \
		cflags="${CXXFLAGS}"
SUB_FILES=	pkg-message
PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README

OPTIONS_DEFINE=		DOCS SHAPE SN
OPTIONS_DEFAULT=	SHAPE

SHAPE_DESC=	Support of XShape extension
SN_DESC=	Startup notification support

SHAPE_USE=		XORG=xext
SHAPE_CONFIGURE_ENABLE=	shape

SN_LIB_DEPENDS=		libstartup-notification-1.so:x11/startup-notification
SN_CONFIGURE_ON=	--enable-libsn

do-install:
		${INSTALL_PROGRAM} ${WRKSRC}/src/idesk ${PREFIX}/bin
		${MKDIR} ${DOCSDIR}
		${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}

.include <bsd.port.mk>
