PORTNAME=	sphinx-basic-ng
PORTVERSION=	0.0.1a12
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinx_basic_ng-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern skeleton for Sphinx themes
WWW=		https://github.com/pradyunsg/sphinx-basic-ng

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=4.0,1<6.0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
