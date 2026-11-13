PORTNAME=	typer
PORTVERSION=	0.27.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typer, build great CLIs. Easy to code. Based on Python type hints
WWW=		https://typer.tiangolo.com/ \
		https://github.com/fastapi/typer

LICENSE=	bsd3 mit
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=	${WRKSRC}/typer/_click/LICENSE.txt
LICENSE_FILE_mit=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>=0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}annotated-doc>=0.0.2:devel/py-annotated-doc@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=13.8.0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}shellingham>=1.3.0:devel/py-shellingham@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=7.13:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=7:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-sugar>=1:devel/py-pytest-sugar@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.6.1:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
TEST_ENV+=	HOME=${WRKDIR}/test-home \
		XDG_CONFIG_HOME=${WRKDIR}/test-home/.config \
		PYTHONPATH=${WRKSRC}:${PYTHONPATH} \
		PYTHONUSERBASE=${FAKE_DESTDIR}${PREFIX}

do-test:
	@${MKDIR} ${WRKDIR}/test-home
	cd ${WRKSRC} && ${SETENV} -u NO_COLOR ${TEST_ENV} TERM=xterm-256color TERMINAL_WIDTH=3000 \
		_TYPER_FORCE_DISABLE_TERMINAL=1 _TYPER_RUN_INSTALL_COMPLETION_TESTS=1 \
		${PYTHON_CMD} -m pytest --cov --cov-report=term-missing \
		-o console_output_style=progress --showlocals --numprocesses=auto

.include <bsd.port.mk>
