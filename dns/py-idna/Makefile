# $MidnightBSD$
# $FreeBSD: head/dns/py-idna/Makefile 400660 2015-11-02 16:30:46Z koobs $

PORTNAME=	idna
PORTVERSION=	2.7
CATEGORIES=	dns python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names in Applications (IDNA)

LICENSE=	python

USES=		python
USE_PYTHON=	autoplist concurrent distutils

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
