PORTNAME=	libmaa
PORTVERSION=	1.5.1
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides a few data structures and helpful functions
WWW=		https://github.com/cheusov/libmaa

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/doc/LICENSE

BUILD_DEPENDS=	mk-configure>=0.29.1:devel/mk-configure

CFLAGS+=	-fPIC
FAKE_OPTS=	trueprefix
MAKE_ARGS+=	MKCOMPILERSETTINGS=yes
MAKE_CMD=	mkcmake
USE_LDCONFIG=	yes

GH_ACCOUNT=	cheusov
USE_GITHUB=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^#SHLIB_TEENY *=/ s|#||' ${WRKSRC}/maa/Makefile

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libmaa.so

.include <bsd.port.mk>
