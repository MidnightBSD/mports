PORTNAME=	libhubbub
PORTVERSION=	0.3.8
CATEGORIES=	www
MASTER_SITES=	http://download.netsurf-browser.org/libs/releases/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML5 parser library
WWW=		https://www.netsurf-browser.org/projects/hubbub/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	netsurf-buildsystem>=1.5:devel/netsurf-buildsystem
LIB_DEPENDS=	libparserutils.so:devel/libparserutils

USES=		gmake gperf iconv:wchar_t localbase pkgconfig
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}

MAKE_ENV+=	BUILD_CC="${CC}" \
		COMPONENT_TYPE="lib-shared"
LDFLAGS+=	${ICONV_LIB}

PLIST_SUB+=	VERSION=${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libhubbub.so*

.include <bsd.port.mk>
