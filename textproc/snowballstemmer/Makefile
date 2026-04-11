PORTNAME=	snowballstemmer
PORTVERSION=	2.2.0
DISTVERSIONPREFIX=	v
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Snowball stemmer library for C
WWW=		https://snowballstem.org/

LICENSE=	bsd3

USES=		gmake perl5
USE_PERL5=	build
USE_LDCONFIG=	yes

MAKEFILE=	GNUmakefile

USE_GITHUB=	yes
GH_ACCOUNT=	snowballstem
GH_PROJECT=	snowball

PLIST_FILES=	bin/stemwords \
		include/libstemmer.h \
		lib/libstemmer.so \
		lib/libstemmer.so.0 \
		lib/libstemmer.so.0.0.0

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/stemwords ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/include/libstemmer.h ${PREFIX}/include
	${INSTALL_LIB} ${WRKSRC}/libstemmer.so.0.0.0 ${PREFIX}/lib
	${RLN} ${PREFIX}/lib/libstemmer.so.0.0.0 \
		${PREFIX}/lib/libstemmer.so.0
	${RLN} ${PREFIX}/lib/libstemmer.so.0.0.0 \
		${PREFIX}/lib/libstemmer.so

.include <bsd.port.mk>
