PORTNAME=	sphinxcontrib-jquery
PORTVERSION=	4.1
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinxcontrib_jquery-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension to include jQuery on newer Sphinx releases
WWW=		https://github.com/sphinx-contrib/jquery

LICENSE=	bsd2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.8:textproc/py-sphinx@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
