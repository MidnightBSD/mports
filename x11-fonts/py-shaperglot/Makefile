PORTNAME=	shaperglot
PORTVERSION=	0.5.0
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test font files for OpenType language support
WWW=		https://github.com/googlefonts/shaperglot

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.2:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gflanguages>=0.4.7:x11-fonts/py-gflanguages@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}num2words>=0.5<0.6:devel/py-num2words@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>=3.19.4,1:devel/py-protobuf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}strictyaml>=0:devel/py-strictyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}termcolor>=1.1.0:devel/py-termcolor@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ufo2ft>=0:x11-fonts/py-ufo2ft@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}vharfbuzz>=0<1:print/py-vharfbuzz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}youseedee>=0:textproc/py-youseedee@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
