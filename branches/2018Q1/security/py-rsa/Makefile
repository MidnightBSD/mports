# Created by: Kubilay Kocak <koobs@FreeBSD.org>
# $FreeBSD: head/security/py-rsa/Makefile 408021 2016-02-04 10:39:48Z koobs $
# $MidnightBSD$

PORTNAME=	rsa
PORTVERSION=	3.3
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure-Python RSA implementation

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyasn1>=0.1.3:${PORTSDIR}/devel/py-pyasn1
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}unittest2>0:${PORTSDIR}/devel/py-unittest2

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} run_tests.py

.include <bsd.port.mk>
