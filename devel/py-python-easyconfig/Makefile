PORTNAME=	python-easyconfig
PORTVERSION=	0.1.7
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-EasyConfig-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for loading configurations easily in Python

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}yaml>3.10:devel/py-yaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>1.9.0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
