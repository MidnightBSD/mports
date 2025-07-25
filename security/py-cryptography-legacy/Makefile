PORTNAME=	cryptography
PORTVERSION=	3.4.8
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-legacy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cryptographic recipes and primitives for Python developers
WWW=		https://github.com/pyca/cryptography

LICENSE=	Apache-2.0 bsd3
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd3=${WRKSRC}/LICENSE.BSD

# 16 failed on magus, env related
NO_TEST=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.12:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.12:devel/py-cffi@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography-vectors>=${PORTVERSION}:security/py-cryptography-vectors@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=1.11.4:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}iso8601>=0:devel/py-iso8601@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pretend>=0:devel/py-pretend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-subtests>=0:devel/py-pytest-subtests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=0,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytz>=0,1:devel/py-pytz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlite3>=0:databases/py-sqlite3@${PY_FLAVOR}

USES=		compiler:env cpe python ssl
USE_PYTHON=	autoplist concurrent pep517 pytest

CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
MAKE_ENV=	CRYPTOGRAPHY_DONT_BUILD_RUST=1
TEST_ENV=	PYTHONPATH=${STAGEDIR}${PYTHON_SITELIBDIR}

CPE_VENDOR=	cryptography_project

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
