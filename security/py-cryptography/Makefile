# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	cryptography
PORTVERSION=	2.9.2
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

EXTRA_PATCHES=  ${PATCHDIR}/openssl102u

# Python 2.7, 3.5-3.8
USES=		compiler:env python:3.6+ ssl
USE_PYTHON=	autoplist concurrent distutils

CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} <= 42
post-patch:
	@${REINPLACE_CMD} -e 's|"-Wno-error=sign-conversion"||' \
		${WRKSRC}/src/_cffi_src/build_openssl.py
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cryptography/hazmat/bindings/*.so

.include <bsd.port.post.mk>
