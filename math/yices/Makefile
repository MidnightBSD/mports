PORTNAME=	yices
DISTVERSIONPREFIX=	${PORTNAME}-
DISTVERSION=	2.7.0
PORTREVISION=	2
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SMT solver
WWW=		https://yices.csl.sri.com/ \
		https://github.com/SRI-CSL/yices2/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	gperf:devel/gperf
LIB_DEPENDS=	libgmp.so:math/gmp

USES=		autoreconf compiler:c11 gmake localbase
USE_GITHUB=	yes
GH_ACCOUNT=	SRI-CSL
GH_PROJECT=	yices2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pic-gmp=${LOCALBASE}/lib/libgmp.so

MAKE_ARGS=	YICES_MAKE_INCLUDE=configs/make.include.${CONFIGURE_TARGET}
CFLAGS+=	-fPIC
PIE_UNSAFE=	yes

NO_TEST=	yes

pre-fake:
	${LN} -sf ${WRKSRC}/build/${ARCH}-unknown-midnightbsd${OSREL}-release ${WRKSRC}/build/${ARCH}-release

post-install: # strip binaries
	@${STRIP_CMD} ${PREFIX}/bin/*

.include <bsd.port.mk>
