PORTNAME=	textx
DISTVERSION=	4.4.0
CATEGORIES=	lang python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-language for DSL implementation inspired by Xtext
WWW=		https://textx.github.io/textX/ \
		https://github.com/textX/textX/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.8.0<5:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}arpeggio>=2.0.0:devel/py-arpeggio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=7.0<9:devel/py-click@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}html5lib>0:www/py-html5lib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}memory-profiler>0:devel/py-memory-profiler@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517

USE_GITHUB=	yes
GH_ACCOUNT=	textX
GH_PROJECT=	textX
GH_TAGNAME=	a9d0c0c78a0e12c56eef10a878955fc373278b12

NO_ARCH=	yes

TEST_ENV=	${MAKE_ENV} \
		PATH=${FAKE_DESTDIR}${PREFIX}/bin:${WRKDIR}/test-prefix${PREFIX}/bin:${PATH} \
		PWD=${WRKDIR} \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		PYTHONNOUSERSITE=1 PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKDIR}/test-prefix${PYTHON_SITELIBDIR}:${PYTHONPATH}

do-test:
	@${MKDIR} ${WRKDIR}/test-dist ${WRKDIR}/test-prefix
	@cd ${WRKSRC} && \
		for project in \
		./tests/functional/registration/projects/types_dsl \
		./tests/functional/registration/projects/flow_dsl \
		./tests/functional/registration/projects/flow_codegen \
		./tests/functional/registration/projects/data_dsl \
		./tests/functional/subcommands/example_project; do \
			${SETENV} ${MAKE_ENV} PYTHONNOUSERSITE=1 ${PYTHON_CMD} -m build \
			--wheel --no-isolation --outdir ${WRKDIR}/test-dist $$project || exit 1; \
		done
	@for wheel in ${WRKDIR}/test-dist/*.whl; do \
		${PYTHON_CMD} -m installer --overwrite-existing --no-compile-bytecode --destdir ${WRKDIR}/test-prefix \
		--prefix ${PREFIX} $$wheel || exit 1; \
	done
	@cd ${WRKDIR} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -v -rs ${WRKSRC}/tests/functional

# tests as of 4.4.0: 340 passed

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=0:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
