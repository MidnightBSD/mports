# $MidnightBSD$
# $FreeBSD: ports/devel/t1lib/Makefile,v 1.33 2006/08/14 22:55:17 clsung Exp $

PORTNAME=	t1lib
PORTVERSION=	5.1.2
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	SUNSITE/libs/graphics/ \
		http://www.skysmurf.nl/comp/FreeBSD/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Type 1 font rasterization library for UNIX/X11

LICENSE=	lgpl

USES=		cpe gmake libtool
GNU_CONFIGURE=	yes
ALL_TARGET=	without_doc
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	X11 DOCS
OPTIONS_DEFAULT=	X11

OPTIONS_SUB=	yes
X11_USE=	XORG=xaw
X11_CONFIGURE_WITH=	x

post-patch:
	@${REINPLACE_CMD} -e \
		'/ALLSUBDIRS/s|$$(DOCSUBDIRS)||g' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/t1lib_doc.pdf ${DOCSDIR}

.include <bsd.port.mk>
