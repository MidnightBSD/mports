# $MidnightBSD$
# $FreeBSD: head/devel/py-wrapt/Makefile 432169 2017-01-22 22:27:54Z rene $

PORTNAME=	wrapt
PORTVERSION=	1.10.11
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Decorators, wrappers and monkey patching

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_PYTHON=	autoplist concurrent distutils
USES=		python

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/wrapt/_wrappers.so

.include <bsd.port.mk>
