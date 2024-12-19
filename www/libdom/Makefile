PORTNAME=	libdom
PORTVERSION=	0.4.2
CATEGORIES=	www
MASTER_SITES=	http://download.netsurf-browser.org/libs/releases/
EXTRACT_SUFX=	-src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Document Object Model library
WWW=		https://www.netsurf-browser.org/projects/libdom/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	netsurf-buildsystem>=1.5:devel/netsurf-buildsystem
LIB_DEPENDS=	libwapcaplet.so:textproc/libwapcaplet \
		libparserutils.so:devel/libparserutils \
		libhubbub.so:www/libhubbub \
		libexpat.so:textproc/expat2

USES=		gmake iconv localbase pkgconfig
USE_LDCONFIG=	yes

MAKE_ENV=	BUILD_CC="${CC}" COMPONENT_TYPE="lib-shared"

PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libdom.so

.include <bsd.port.mk>
