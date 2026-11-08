PORTNAME=	cryptography
PORTVERSION=	50.0.1
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cryptographic recipes and primitives for Python developers
WWW=		https://github.com/pyca/cryptography

LICENSE=			Apache-2.0 bsd3
LICENSE_COMB=			dual
LICENSE_FILE_Apache-2.0=		${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=2.0.0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.14.1<2:devel/py-maturin@${PY_FLAVOR} \
		${PY_SETUPTOOLS}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=2.0.0:devel/py-cffi@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}bcrypt>=3.1.5:security/py-bcrypt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}certifi>=2024:security/py-certifi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cryptography-vectors=50.0.1:security/py-cryptography-vectors@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pretend>=0.7:devel/py-pretend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7.4.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-benchmark>=4.0:devel/py-pytest-benchmark@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.10.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.5.0:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		cargo cpe python:3.9+ ssl
USE_PYTHON=	allflavors autoplist concurrent pep517

CARGO_BUILD=	no
CARGO_CARGOTOML=${WRKSRC}/src/rust/Cargo.toml
CARGO_INSTALL=	no
MAKE_ENV+=	${CARGO_ENV}
CARGO_TEST=	no
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

CPE_VENDOR=	cryptography_project

OPTIONS_DEFINE=	SSH

SSH_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}bcrypt>=3.1.5:security/py-bcrypt@${PY_FLAVOR}

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPATH} \
		${PYTHON_CMD} -m pytest

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} == 30900 || ${PYTHON_REL} == 30901
IGNORE=		requires Python 3.9.2 or later
.endif

.if ${PYTHON_REL} >= 31500
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}cffi>=2.1:devel/py-cffi@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.13.2:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
