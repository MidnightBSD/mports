PORTNAME=	pynacl
DISTVERSION=	1.6.2
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:tl}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python binding to the Networking and Cryptography library
WWW=		https://github.com/pyca/pynacl

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.29.0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cffi>=2.0.0:devel/py-cffi@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=2.0.0:devel/py-cffi@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7.4.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.10.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.5.0,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=3.27.0:devel/py-hypothesis@${PY_FLAVOR}

USES=		python localbase
USE_PYTHON=	pep517 autoplist

# Preserve the established lowercase package name for upstream wheel metadata.
PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} --prefix ${TRUE_PREFIX} ${BUILD_WRKSRC}/dist/PyNaCl-${DISTVERSION}*.whl && \
	${REINPLACE_CMD} -i '' -e 's|PyNaCl-|pynacl-|g' ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/PyNaCl-${DISTVERSION}.dist-info/RECORD && \
	${MV} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/PyNaCl-${DISTVERSION}.dist-info ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pynacl-${DISTVERSION}.dist-info

OPTIONS_DEFINE=	BUNDLED_NACL
BUNDLED_NACL_DESC=	Use bundled NaCl version
BUNDLED_NACL_BUILD_RUN_DEPENDS_OFF=	libsodium>=1.0.19:security/libsodium
BUNDLED_NACL_LIB_DEPENDS_OFF=	libsodium.so:security/libsodium
BUNDLED_NACL_MAKE_ENV_OFF=	SODIUM_INSTALL=system

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/nacl/_sodium*.so

do-test:
	@cd ${WRKSRC} && ${SETENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} ${PYTHON_CMD} -m pytest -rs tests

.include <bsd.port.mk>
