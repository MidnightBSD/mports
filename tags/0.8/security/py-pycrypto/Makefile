# $MidnightBSD$

PORTNAME=	pycrypto
PORTVERSION=	2.6
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP \
		https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Python Cryptography Toolkit

LICENSE=	agg
# publicdom and python license

USES=		python
USE_PYTHON=	distutils autoplist

GNU_CONFIGURE=	yes

OPTIONS_DEFINE=		GMP
OPTIONS_DEFAULT=	GMP
GMP_DESC=	Use GMP for faster DSA/RSA operations

OPTIONSFILE?=		${PORT_DBDIR}/py-${PORTNAME}/options

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGMP}
LIB_DEPENDS+=		gmp:${PORTSDIR}/math/gmp
CONFIGURE_ARGS+=	--with-gmp
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
PLIST_SUB+=		GMP=""
.else
CONFIGURE_ARGS+=	--without-gmp
PLIST_SUB+=		GMP="@comment "
.endif

pre-patch:
	@${REINPLACE_CMD} -e "s|%%LOCALBASE%%|${LOCALBASE}|" ${WRKSRC}/setup.py

test: build
	cd ${WRKSRC} && ${PYTHON_CMD} ${PYSETUP} test

regression-test: test

.include <bsd.port.mk>
