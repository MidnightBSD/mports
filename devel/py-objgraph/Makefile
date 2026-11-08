PORTNAME=	objgraph
PORTVERSION=	3.6.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Draws Python object reference graphs with graphviz
WWW=		https://mg.pov.lt/objgraph/ \
		https://pypi.org/project/objgraph/ \
		https://github.com/mgedmin/objgraph

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}graphviz>=0:graphics/py-graphviz@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist pep517
NO_ARCH=	yes

do-test:
	@cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${TEST_WRKSRC}:${PYTHONPATH} \
		${PYTHON_CMD} -c 'import sys; sys.path.pop(0); import objgraph, runpy; print("Testing", objgraph.__file__, flush=True); runpy.run_path("tests.py", run_name="__main__")'

.include <bsd.port.mk>
