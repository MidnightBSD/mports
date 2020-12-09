# Created by: Olivier Duchateau

PORTNAME=	libcss
PORTVERSION=	0.9.1
CATEGORIES=	textproc
MASTER_SITES=	https://download.netsurf-browser.org/libs/releases/
EXTRACT_SUFX=	-src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cascading Style Sheets library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	netsurf-buildsystem>=1.5:devel/netsurf-buildsystem
LIB_DEPENDS=	libwapcaplet.so:textproc/libwapcaplet \
		libparserutils.so:devel/libparserutils

USES=		gmake iconv:wchar_t localbase pkgconfig

USE_LDCONFIG=	yes
MAKE_ENV=	COMPONENT_TYPE="lib-shared"
CFLAGS+=		-Wno-error
LDFLAGS+=	${ICONV_LIB}
PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libcss.so

.include <bsd.port.mk>
