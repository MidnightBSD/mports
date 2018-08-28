# $MidnightBSD$
# $FreeBSD: ports/textproc/cdiff/Makefile,v 1.9 2006/09/04 08:17:26 linimon Exp $

PORTNAME=	cdiff
PORTVERSION=	0.9.7
PORTEPOCH=	1
MASTER_SITES=	FREEBSD_LOCAL/mat/cdiff GH
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diff readability enhancher for color terminals

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=
GH_ACCOUNT=	ymattw

USES=		python
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	DOCS

PORTDOCS=	README.rst

post-install:
	${INSTALL} -d ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
