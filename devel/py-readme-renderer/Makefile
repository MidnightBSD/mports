PORTNAME=	readme-renderer
PORTVERSION=	46.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	readme_renderer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for rendering "readme" descriptions
WWW=		https://github.com/pypa/readme_renderer

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0.22.4,1:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}nh3>=0.2.14:www/py-nh3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.5.1:textproc/py-pygments@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	MD
OPTIONS_DEFAULT=MD
MD_DESC=	Markdown support

MD_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}comrak>=0.0.13:textproc/py-comrak@${PY_FLAVOR}

.include <bsd.mport.options.mk>

.if !${PORT_OPTIONS:MMD}
TEST_ARGS+=	-W ignore:Markdown\ renderers\ are\ not\ available:UserWarning:readme_renderer.markdown
.endif

do-test:
	@${MKDIR} ${WRKDIR}/test-run/tests
	@${CP} -R ${WRKSRC}/tests/. ${WRKDIR}/test-run/tests/
	@${CP} ${WRKSRC}/pyproject.toml ${WRKSRC}/README.rst ${WRKDIR}/test-run/
	@cd ${WRKDIR}/test-run && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -m pytest -Wall --strict-markers --cov ${TEST_ARGS}

.include <bsd.port.mk>
