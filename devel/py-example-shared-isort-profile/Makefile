PORTNAME=	example-shared-isort-profile
PORTVERSION=	0.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	example_shared_isort_profile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Example shared profile for isort
WWW=		https://pypi.org/project/example-shared-isort-profile/

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

do-test:
	@cd ${WRKDIR} && ${SETENV} ${PYTHON_TEST_ENV} ${PYTHON_CMD} -c 'from pathlib import Path; from importlib import import_module; from importlib.metadata import entry_points; ep = next(ep for ep in entry_points(group="isort.profiles") if ep.name == "example"); assert Path(import_module(ep.module).__file__).resolve().is_relative_to(Path("${FAKE_DESTDIR}${PYTHON_SITELIBDIR}").resolve()); p = ep.load(); assert p["line_length"] == 100'

.include <bsd.port.mk>
