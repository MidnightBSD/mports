# $MidnightBSD$
# $FreeBSD: head/devel/py-astroid/Makefile 432193 2017-01-23 03:17:37Z vanilla $

PORTNAME=	astroid
PORTVERSION=	1.6.3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension for Python compiler.ast module

LICENSE=	lgpl2.1

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wrapt>0:devel/py-wrapt \
		${PYTHON_PKGNAMEPREFIX}lazy-object-proxy>0:devel/py-lazy-object-proxy \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six

USES=		python
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3400
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}backports.functools_lru_cache>=0:devel/py-backports.functools_lru_cache \
		${PYTHON_PKGNAMEPREFIX}singledispatch>=0:devel/py-singledispatch
.endif

.include <bsd.port.post.mk>
