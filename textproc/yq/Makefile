PORTNAME=	yq
DISTVERSION=	3.4.3
CATEGORIES=	textproc python
MASTER_SITES=	PYPI

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line YAML and XML processor, jq wrapper for YAML/XML documents
WWW=		https://kislyuk.github.io/yq/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=7:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	jq:textproc/jq \
		${PYTHON_PKGNAMEPREFIX}argcomplete>=1.8.1:devel/py-argcomplete@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyaml>=5.3.1:textproc/py-pyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomlkit>=0.11.6:textproc/py-tomlkit@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xmltodict>=0.11.0:devel/py-xmltodict@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils noflavors autoplist

CONFLICTS_INSTALL=	go-yq

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
