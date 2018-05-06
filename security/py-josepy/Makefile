# Created by: Carlos J Puga Medina <cpm@FreeBSD.org>
# $FreeBSD: head/security/py-josepy/Makefile 461672 2018-02-12 23:11:38Z cpm $
# $MidnightBSD$

PORTNAME=	josepy
PORTVERSION=	1.0.1
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JOSE protocol implementation in Python

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=0.8:security/py-cryptography \
		${PYTHON_PKGNAMEPREFIX}openssl>=0.13:security/py-openssl \
		${PYTHON_PKGNAMEPREFIX}setuptools>=1.0:devel/py27-setuptools \
		${PYTHON_PKGNAMEPREFIX}six>=1.9.0:devel/py-six
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>0:devel/py-mock

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
