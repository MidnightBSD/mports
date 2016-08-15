# $MidnightBSD$
# $FreeBSD: ports/graphics/libemf/Makefile,v 1.12 2010/12/04 07:32:03 ade Exp $

PORTNAME=	libEMF
PORTVERSION=	1.0.7
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced Metafile Library
LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

USES=		libtool
GNU_CONFIGURE=	yes

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/html/* ${DOCSDIR}

.include <bsd.port.mk>
