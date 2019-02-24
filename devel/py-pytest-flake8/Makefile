# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	pytest-flake8
PORTVERSION=	1.0.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	pytest plugin to check FLAKE8 requirement

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flake8>=3.5:devel/py-flake8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=3.5:devel/py-pytest@${PY_FLAVOR}

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent distutils
USES=		python

.include <bsd.port.mk>
