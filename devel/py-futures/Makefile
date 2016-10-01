# $MidnightBSD$
# $FreeBSD: head/devel/py-futures/Makefile 410017 2016-03-03 09:13:32Z koobs $

PORTNAME=	futures
PORTVERSION=	3.0.5
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backport of the concurrent.futures package from Python 3.2

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:-2.7
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

# Some tests require 256 semaphores. Set the following sysctl(8)
# before running tests: sysctl p1003_1b.sem_nsems_max=512

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} test_futures.py

.include <bsd.port.mk>
