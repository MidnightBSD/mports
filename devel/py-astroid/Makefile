# $MidnightBSD$
# $FreeBSD: head/devel/py-astroid/Makefile 432193 2017-01-23 03:17:37Z vanilla $

PORTNAME=	astroid
PORTVERSION=	1.4.9
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
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
