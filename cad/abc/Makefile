PORTNAME=	abc
DISTVERSION=	g20220920
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	System for sequential synthesis and verification
WWW=		https://people.eecs.berkeley.edu/~alanmi/abc/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/copyright.txt

BUILD_DEPENDS=	gmake:devel/gmake

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	berkeley-abc
GH_TAGNAME=	5fb4912559380dfcb55e76c23d3fa69c0da454f8
USE_LDCONFIG=	yes

BINARY_ALIAS=	make=${GMAKE}

PLIST_FILES=	bin/${PORTNAME} lib/lib${PORTNAME}.so

OPTIONS_DEFINE=			READLINE THREADS
OPTIONS_DEFAULT=		READLINE THREADS

READLINE_USES=			readline
READLINE_CONFIGURE_ENV=		ABC_READLINE_LIBRARIES="-L${LOCALBASE}/lib -lreadline"
READLINE_CONFIGURE_ENV_OFF=	ABC_USE_NO_READLINE=1

THREADS_CONFIGURE_ENV_OFF=	ABC_USE_NO_PTHREADS=1

do-install: # https://github.com/berkeley-abc/abc/issues/71
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/lib${PORTNAME}.so ${STAGEDIR}${PREFIX}/lib

.include <bsd.port.mk>
