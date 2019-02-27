# $MidnightBSD$
# $FreeBSD: head/devel/py-pycparser/Makefile 371280 2014-10-20 16:04:12Z mva $

PORTNAME=	pycparser
PORTVERSION=	2.18
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C parser in Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

# README says 2.7+, 3.4, 3.5+
# TravisCI tests 2.6, 2.7, 3.2, 3.4, 3.5
# https://travis-ci.org/eliben/pycparser
# Go with the most accurate without missing any
USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} tests/all_tests.py

.include <bsd.port.mk>
