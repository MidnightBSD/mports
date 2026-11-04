PORTNAME=	jsonschema
DISTVERSION=	4.26.0
PORTREVISION=	0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON Schema validation for Python
WWW=		https://github.com/Julian/jsonschema

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-fancy-pypi-readme>=0:devel/py-hatch-fancy-pypi-readme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0:devel/py-hatch-vcs@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=22.2.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema-specifications>=2023.03.6:devel/py-jsonschema-specifications@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}referencing>=0.28.4:devel/py-referencing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rpds-py>=0.7.1:devel/py-rpds-py@${PY_FLAVOR}
#TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pip>=0:devel/py-pip@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517
# pytest

#TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
NO_TEST=	yes

CONFLICTS_INSTALL=	py*-jsonschema3 # bin/jsonschema

NO_ARCH=	yes

fake-post-install:
	@if [ ! -e ${FAKE_DESTDIR}${PREFIX}/bin/jsonschema ] && \
		[ -e ${FAKE_DESTDIR}${PREFIX}/bin/jsonschema-${PYTHON_DEFAULT} ]; then \
		${MV} ${FAKE_DESTDIR}${PREFIX}/bin/jsonschema-${PYTHON_DEFAULT} \
			${FAKE_DESTDIR}${PREFIX}/bin/jsonschema; \
	fi

.include <bsd.port.mk>
