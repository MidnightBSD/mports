# $MidnightBSD$
# $FreeBSD: ports/graphics/libemf/Makefile,v 1.12 2010/12/04 07:32:03 ade Exp $

PORTNAME=	libEMF
PORTVERSION=	1.0
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced Metafile Library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/html/* ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
