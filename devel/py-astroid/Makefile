# $MidnightBSD$
# $FreeBSD: head/devel/py-astroid/Makefile 432193 2017-01-23 03:17:37Z vanilla $

PORTNAME=	astroid
PORTVERSION=	2.0.4
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstract syntax tree for Python with inference support

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LESSER

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-runner>=0:devel/py-pytest-runner
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lazy-object-proxy>=0:devel/py-lazy-object-proxy \
		${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six \
		${PYTHON_PKGNAMEPREFIX}wrapt>=0:devel/py-wrapt
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest

USES=		python:3.4+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing>=0:devel/py-typing
.endif

.if ${PYTHON_REL} < 3700
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typed-ast>=0:devel/py-typed-ast
.endif

.include <bsd.port.post.mk>
