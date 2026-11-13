PORTNAME=	pdm-backend
DISTVERSION=	2.3.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	23
DISTNAME=	pdm_backend-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private PDM 2.3 build backend
WWW=		https://backend.pdm-project.org/

LICENSE=	mit bsd2
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKDIR}/MIT-LICENSES
LICENSE_FILE_bsd2=	${WRKSRC}/src/pdm/backend/_vendor/packaging/LICENSE.BSD

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=0:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		git:devel/git

USES=		python:3.8+
USE_PYTHON=	allflavors pep517
NO_ARCH=	yes

_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-pdm-backend/23

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
BUILD_RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=3.6:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

post-extract:
	${CAT} ${WRKSRC}/LICENSE \
		${WRKSRC}/src/pdm/backend/_vendor/editables/LICENSE.txt \
		${WRKSRC}/src/pdm/backend/_vendor/pyproject_metadata/LICENSE \
		${WRKSRC}/src/pdm/backend/_vendor/tomli/LICENSE \
		${WRKSRC}/src/pdm/backend/_vendor/tomli_w/LICENSE > ${LICENSE_FILE_mit}

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} \
		${WRKSRC}/dist/pdm_backend-${DISTVERSION}-py3-none-any.whl

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${_PRIVATE_DIR}:${PYTHON_SITELIBDIR} \
		GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1 \
		GIT_AUTHOR_NAME=mports-test GIT_AUTHOR_EMAIL=ports@example.invalid \
		GIT_COMMITTER_NAME=mports-test GIT_COMMITTER_EMAIL=ports@example.invalid \
		${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.post.mk>
