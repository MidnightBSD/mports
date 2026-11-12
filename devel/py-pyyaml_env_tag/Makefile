PORTNAME=	pyyaml_env_tag
PORTVERSION=	1.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Custom YAML tag for referencing environment variables in YAML files
WWW=		https://github.com/waylan/pyyaml-env-tag

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	@(cd ${WRKDIR} && ${SETENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR} ${PYTHON_CMD} -m unittest discover -s ${WRKSRC}/tests -v)

.include <bsd.port.mk>
