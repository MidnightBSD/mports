# $MidnightBSD$
# $FreeBSD: head/devel/py-isort/Makefile 432169 2017-01-22 22:27:54Z rene $

PORTNAME=	isort
PORTVERSION=	4.3.4
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python import sorter utility

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PY_FUTURES}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR}

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent distutils
USES=		python

.include <bsd.port.mk>
