PORTNAME=	t1lib
PORTVERSION=	5.1.2
PORTREVISION=	4
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	SUNSITE/libs/graphics/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Type 1 font rasterization library for Unix/X11
WWW=		https://www.t1lib.org/

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/LGPL

USES=		cpe gmake libtool
GNU_CONFIGURE=	yes
ALL_TARGET=	without_doc
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	X11 DOCS
OPTIONS_DEFAULT=	X11

OPTIONS_SUB=	yes
X11_USES=	xorg
X11_USE=	XORG=ice,sm,x11,xaw,xext,xmu,xpm,xt
X11_CONFIGURE_WITH=	x

post-patch:
	@${REINPLACE_CMD} -e \
		'/ALLSUBDIRS/s|$$(DOCSUBDIRS)||g' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/t1lib_doc.pdf ${DOCSDIR}

.include <bsd.port.mk>
