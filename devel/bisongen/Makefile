# $MidnightBSD$
# $FreeBSD: ports/devel/bisongen/Makefile,v 1.3 2007/07/30 09:41:08 alexbl Exp $
#

PORTNAME=	bisongen
PORTVERSION=	0.8.0b1
CATEGORIES=	devel python
MASTER_SITES=	ftp://ftp.fourthought.com/pub/BisonGen/
DISTNAME=	BisonGen-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A general-purpose parser generator for Python

LICENSE=	other
#apache 1.1 like

USES=		tar:bzip2 python:2
USE_PYTHON=	distutils autoplist
PYDISTUTILS_PKGNAME=	BisonGen

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/simple/* ${EXAMPLESDIR}

.include <bsd.port.mk>
