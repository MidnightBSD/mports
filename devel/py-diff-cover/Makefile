PORTNAME=	diff-cover
DISTVERSION=	9.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run coverage and linting reports on diffs
WWW=		https://github.com/Bachmann1234/diff_cover

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}chardet>=3.0.0:textproc/py-chardet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=2.7.1:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>=0.13.1:devel/py-pluggy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.9.0:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomli>=1.2.1:textproc/py-tomli@${PY_FLAVOR}
TEST_DEPENDS=	pylint${PYTHON_PKGNAMESUFFIX}>0:devel/pylint@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-datadir>=1.4.1:devel/py-pytest-datadir@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>0:devel/py-pytest-mock@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist pytest # 2 tests fail, see https://github.com/Bachmann1234/diff_cover/issues/400

MAKE_ENV+=	GIT_DIR=${WRKDIR} # workaround for https://github.com/python-poetry/poetry/issues/5547
TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
