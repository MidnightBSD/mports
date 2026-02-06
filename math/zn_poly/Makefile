PORTNAME=	zn_poly
DISTVERSION=	0.9.2
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for polynomial arithmetic
WWW=		https://web.maths.unsw.edu.au/~davidharvey/code/zn_poly/

LICENSE=		gpl2 gpl3
LICENSE_COMB=		dual
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgmp.so:math/gmp

USES=		gmake python:build tar:bz2
USE_GITLAB=	yes
GL_ACCOUNT=	sagemath
GL_TAGNAME=	f421e4788914e1625488d9b7d5aaab877eb1a940

OPTIONS_DEFINE=	DOCS

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix="${FAKE_DESTDIR}${TRUE_PREFIX}"	\
		--cppflags="${CPPFLAGS}"	\
		--cflags="${CFLAGS} -fPIC"	\
		--cxxflags="${CXXFLAGS}"	\
		--ldflags="${LDFLAGS}"		\
		--gmp-prefix="${LOCALBASE}"
MAKEFILE=	makefile
ALL_TARGET=	all libzn_poly.so
USE_LDCONFIG=	yes
TEST_TARGET=	check

.if defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=--disable-tuning
.endif

pre-configure:
	${REINPLACE_CMD} -e 's|python|${PYTHON_CMD}|'	\
		${WRKSRC}/${CONFIGURE_SCRIPT}

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libzn_poly-${DISTVERSION}.so		\
		${STAGEDIR}${PREFIX}/lib/libzn_poly-${DISTVERSION}.so.0.0.0
	${RLN} ${STAGEDIR}${PREFIX}/lib/libzn_poly-${DISTVERSION}.so.0.0.0	\
		${STAGEDIR}${PREFIX}/lib/libzn_poly-${DISTVERSION:R}.so.0
	${RLN} ${STAGEDIR}${PREFIX}/lib/libzn_poly-${DISTVERSION}.so.0.0.0	\
		${STAGEDIR}${PREFIX}/lib/libzn_poly-${DISTVERSION:R}.so

.include <bsd.port.mk>
