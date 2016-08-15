# Created by: Neil Booth
# $FreeBSD: head/security/py-ecdsa/Makefile 371453 2014-10-24 16:50:42Z mva $
# $MidnightBSD$

PORTNAME=	ecdsa
PORTVERSION=	0.11
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ECDSA cryptographic signature library (pure python)

LICENSE=	mit

USES=		python:2
USE_PYTHON=	distutils autoplist

regression-test: build
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYSETUP} test

.include <bsd.port.mk>
