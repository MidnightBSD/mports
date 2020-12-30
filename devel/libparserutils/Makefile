# Created by: David Romano <unobe@cpan.org>

PORTNAME=	libparserutils
PORTVERSION=	0.2.4
CATEGORIES=	devel
MASTER_SITES=	http://download.netsurf-browser.org/libs/releases/
EXTRACT_SUFX=	-src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lexer/parser utility functions for NetSurf

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	netsurf-buildsystem>=1.5:devel/netsurf-buildsystem

USES=		gmake iconv localbase pkgconfig
USE_LDCONFIG=	yes

MAKE_ENV=	COMPONENT_TYPE="lib-shared"
LDFLAGS+=	${ICONV_LIB} -L/usr/local/lib

PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libparserutils.so

.include <bsd.port.mk>
