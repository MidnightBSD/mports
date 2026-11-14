PORTNAME=	example-isort-sorting-plugin
PORTVERSION=	0.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	example_isort_sorting_plugin-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Example sorting plugin for isort
WWW=		https://pypi.org/project/example-isort-sorting-plugin/

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}natsort>=7.1.1:devel/py-natsort@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

do-test:
	@cd ${WRKDIR} && ${SETENV} ${PYTHON_TEST_ENV} ${PYTHON_CMD} -c 'from pathlib import Path; from importlib import import_module; from importlib.metadata import entry_points; ep = next(ep for ep in entry_points(group="isort.sort_function") if ep.name == "natural_plus"); assert Path(import_module(ep.module).__file__).resolve().is_relative_to(Path("${FAKE_DESTDIR}${PYTHON_SITELIBDIR}").resolve()); f = ep.load(); assert f(["x10", "x2"]) == ["x2", "x10"]'

.include <bsd.port.mk>
