PORTNAME=	pycrypto
PORTVERSION=	2.6.1
PORTREVISION=	3
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Cryptography Toolkit
WWW=		https://pycrypto.org

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

DEPRECATED=	Unmaintained, obsolete, and contains security vulnerabilities. Use security/py-pycryptodome instead
EXPIRATION_DATE=2022-12-30

USES=		cpe python:3.6-3.10
USE_PYTHON=	distutils autoplist

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}pycryptodome

CPE_VENDOR=	dlitz

OPTIONSFILE?=         ${PORT_DBDIR}/py-${PORTNAME}/options

GNU_CONFIGURE=	yes

OPTIONS_DEFINE=		GMP
OPTIONS_DEFAULT=	GMP

GMP_DESC=		Use GMP for faster DSA/RSA operations
GMP_CONFIGURE_WITH=	gmp
GMP_CPPFLAGS=		-I${LOCALBASE}/include
GMP_LDFLAGS=		-L${LOCALBASE}/lib
GMP_LIB_DEPENDS=	libgmp.so:math/gmp

NO_TEST=	yes

pre-patch:
	@${REINPLACE_CMD} -e "s|%%LOCALBASE%%|${LOCALBASE}|" ${WRKSRC}/setup.py

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/Crypto/*/*.so

.include <bsd.port.mk>
