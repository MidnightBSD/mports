PORTNAME=	cheetah
DISTVERSION=	3.4.0.post5
CATEGORIES=	devel textproc www python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML template engine for Python
WWW=		https://cheetahtemplate.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}markdown>=2.0.3:textproc/py-markdown@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=0:textproc/py-pygments@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517
PEP517_WHEEL_DISTNAME=	ct3

USE_GITHUB=	yes
GH_ACCOUNT=	CheetahTemplate3
GH_PROJECT=	cheetah3

TEST_ENV+=	HOME=${WRKDIR}/test-home LC_CTYPE=en_US.UTF-8 PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR} \
		PATH=${FAKE_DESTDIR}${PREFIX}/bin:${PATH}

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/Cheetah/*.so

do-test:
	@${MKDIR} ${WRKDIR}/test-home
	@cd ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/Cheetah/Tests && \
		${SETENV} ${TEST_ENV} ${PYTHON_CMD} Test.py
	@cd ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/Cheetah/Tests && \
		${SETENV} ${TEST_ENV} ${PYTHON_CMD} Test.py --namemapper-pure
	@cd ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/Cheetah/Tests && \
		${SETENV} ${TEST_ENV} ${PYTHON_CMD} test_abs_import.py

.include <bsd.port.mk>
