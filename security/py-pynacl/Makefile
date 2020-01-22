# Created by: Yuri Victorovich <yuri@rawbw.com>

PORTNAME=	pynacl
DISTVERSION=	1.3.0
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyNaCl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python binding to the Networking and Cryptography library

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.4.1:devel/py-cffi@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.4.1:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR}

USES=		python localbase
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=	BUNDLED_NACL
BUNDLED_NACL_DESC=	Use bundled NaCl version
BUNDLED_NACL_LIB_DEPENDS_OFF=	libsodium.so:security/libsodium
BUNDLED_NACL_MAKE_ENV_OFF=	SODIUM_INSTALL=system

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/nacl/_sodium*.so

.include <bsd.port.mk>
