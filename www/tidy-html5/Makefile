PORTNAME=	tidy-html5
PORTVERSION=	5.8.0
PORTREVISION=	3
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tidy tidies HTML and XML documents
WWW=		https://www.html-tidy.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/README/LICENSE.md

USE_GITHUB=	yes
GH_ACCOUNT=	htacg

USES=		cmake gnome
USE_GNOME=	libxslt
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_SHARED_LIB:BOOL=ON	\
		-DTIDY_CONSOLE_SHARED:BOOL=ON   \
		-DMAN_INSTALL_DIR=${PREFIX}/share/man/man1

PLIST_SUB=	VER=${PORTVERSION}

post-install:
	# To avoid conflict ATM - to be removed later
	${MV} ${STAGEDIR}${PREFIX}/bin/tidy ${STAGEDIR}${PREFIX}/bin/tidy5
	${MV} ${STAGEDIR}${PREFIX}/lib/libtidy.a ${STAGEDIR}${PREFIX}/lib/libtidys.a
	${MV} ${STAGEDIR}${PREFIX}/lib/libtidy.so ${STAGEDIR}${PREFIX}/lib/libtidy5.so
	${MV} ${STAGEDIR}${PREFIX}/share/man/man1/tidy.1 ${STAGEDIR}${PREFIX}/share/man/man1/tidy5.1

.include <bsd.port.mk>
