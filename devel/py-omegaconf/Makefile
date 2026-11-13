PORTNAME=	omegaconf
DISTVERSION=	2.4.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://codeload.github.com/hydra-ecosystem/omegaconf/tar.gz/acd86748f73da70a9820bd4c3f3b6c090cf74967?filename=/:tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${PORTNAME}-${DISTVERSION}-tests.tar.gz:tests
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible configuration library
WWW=		https://github.com/hydra-ecosystem/omegaconf

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=5.1.0:devel/py-pyyaml@${PY_FLAVOR}
TEST_DEPENDS=	bash:shells/bash \
		git:devel/git \
		jq:textproc/jq \
		${PYTHON_PKGNAMEPREFIX}attrs>0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>0:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		java:build python:3.10+
JAVA_VERSION=	11+

USE_PYTHON=	pep517 autoplist pytest

TEST_WRKSRC=	${WRKDIR}/upstream-tests
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
TEST_ARGS=	--import-mode=append -Werror

NO_ARCH=	yes

# Use the bundled ANTLR generator matching the vendored Python runtime.
post-patch:
	@${REINPLACE_CMD} -e 's|^\( *\)"java",$$|\1"${JAVA}",|' \
		-e 's|str(project_root / "omegaconf" / "grammar" / grammar)|str(Path("omegaconf") / "grammar" / grammar)|' \
		${WRKSRC}/build_helpers/build_helpers.py

pre-test:
	@${MKDIR} ${TEST_WRKSRC}
	${TAR} -xzf ${DISTDIR}/${PORTNAME}-${DISTVERSION}-tests.tar.gz \
		-C ${TEST_WRKSRC} --strip-components 1
	${CP} ${WRKSRC}/omegaconf/grammar/gen/*.py \
		${TEST_WRKSRC}/omegaconf/grammar/gen/

.include <bsd.port.mk>
