PORTNAME=	types-PyYAML
PORTVERSION=	6.0.12.20260906
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	types_pyyaml-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for PyYAML
WWW=		https://pypi.org/project/types-PyYAML/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist pep517
PEP517_WHEEL_DISTNAME=	types_pyyaml
NO_ARCH=	yes

.include <bsd.port.mk>
