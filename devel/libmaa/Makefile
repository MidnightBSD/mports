PORTNAME=	libmaa
PORTVERSION=	1.4.7
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides a few data structures and helpful functions

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/doc/LICENSE

BUILD_DEPENDS=	mk-configure>=0.29.1:devel/mk-configure

OPTIONS_DEFINE=	DOCS

MAKE_ARGS=	DOCDIR=${DOCSDIR} -I/usr/local/share/mk-configure/mk/
MAKE_CMD=	mkcmake
NO_CONFIGURE=	yes
USE_LDCONFIG=	yes

GH_ACCOUNT=	cheusov
USE_GITHUB=	yes

FAKE_OPTS=	trueprefix

post-patch:
	@${REINPLACE_CMD} -e '/^FILES *=/ s|LICENSE||' ${WRKSRC}/doc/Makefile
	@${REINPLACE_CMD} -e '/^#SHLIB_TEENY *=/ s|#||' ${WRKSRC}/maa/Makefile

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libmaa.so

.include <bsd.port.mk>
