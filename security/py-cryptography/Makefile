PORTNAME=	cryptography
PORTVERSION=	42.0.5
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cryptographic recipes and primitives for Python developers
WWW=		https://github.com/pyca/cryptography

LICENSE=			apache2 bsd3
LICENSE_COMB=			dual
LICENSE_FILE_apache2=		${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.12:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-rust>=0.11.4:devel/py-setuptools-rust@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.12:devel/py-cffi@${PY_FLAVOR}

USES=		cargo cpe python ssl
USE_PYTHON=	autoplist concurrent pep517

NO_TEST=	yes

CARGO_BUILD=	no
CARGO_CARGOLOCK=${WRKSRC}/src/rust/Cargo.lock
CARGO_CARGOTOML=${WRKSRC}/src/rust/Cargo.toml
CARGO_INSTALL=	no
CARGO_TEST=	no
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

CPE_VENDOR=	cryptography_project

OPTIONS_DEFINE=	SSH

SSH_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}bcrypt>=3.1.5:security/py-bcrypt@${PY_FLAVOR}

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
