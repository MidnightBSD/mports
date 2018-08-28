# Created by: Jeffrey Hsu <hsu@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/devel/jam/Makefile 347405 2014-03-07 16:49:09Z bapt $

PORTNAME=	jam
PORTVERSION=	2.5
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.perforce.com/jam/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build utility like make(1)

LICENSE=	other

OPTIONS_DEFINE=	DOCS
NO_WRKSUBDIR=	yes
USES=		zip

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.html ${DOCSDIR}

.include <bsd.port.mk>
