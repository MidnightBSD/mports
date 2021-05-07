# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	cryptography
PORTVERSION=	3.3.2
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cryptographic recipes and primitives for Python developers

LICENSE=			apache2 bsd3
LICENSE_COMB=			dual
LICENSE_FILE_apache2=		${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.8:devel/py-cffi@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.8:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.4.1:devel/py-six@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography-vectors>=${PORTVERSION}:security/py-cryptography-vectors@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=1.11.4:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}iso8601>0:devel/py-iso8601@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pretend>0:devel/py-pretend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=3.6.0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytz>0:devel/py-pytz@${PY_FLAVOR}

# Python 2.7, 3.5-3.8
USES=		compiler:env python:3.6+ ssl
USE_PYTHON=	autoplist concurrent distutils

CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

NO_TEST=	yes

.include <bsd.port.pre.mk>

# OpenSSL 1.0.2t got some curve matching parameter code backported before it
# has reached its End-of-Life and security/py-cryptography already had some
# code to handle this case, but it assumed OpenSSL 1.1.0+ .
#
# This has been fixed in 3.0-23-g241f8450 of security/py-cryptography and to be
# clear: It isn't a security fix but rather a workaround to handle unnamed but
# really named curves with OpenSSL 1.0.2t/u .

# We need to keep old py-cryptography and py-openssl for 11.x release
# due to outdated OpenSSL version in base
.if ${SSL_DEFAULT} == "base"
. if ${OSVERSION} >= 200000
# 2.x got OpenSSL 1.0.2t
# 
PORTVERSION=	2.9.2
EXTRA_PATCHES=	${PATCHDIR}/openssl102u
. endif
.endif

.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} <= 42
post-patch:
	@${REINPLACE_CMD} -e 's|"-Wno-error=sign-conversion"||' \
		${WRKSRC}/src/_cffi_src/build_openssl.py
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cryptography/hazmat/bindings/*.so

.include <bsd.port.post.mk>
