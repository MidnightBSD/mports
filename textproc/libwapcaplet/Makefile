PORTNAME=	libwapcaplet
PORTVERSION=	0.4.3
CATEGORIES=	textproc
MASTER_SITES=	http://download.netsurf-browser.org/libs/releases/
EXTRACT_SUFX=	-src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	String internment library
WWW=		https://www.netsurf-browser.org/projects/libwapcaplet/

LICENSE=	mit

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	netsurf-buildsystem>=1.5:devel/netsurf-buildsystem \
		${LOCALBASE}/bin/flex:textproc/flex

USES=		gmake
USE_LDCONFIG=	yes

MAKE_ENV=	BUILD_CC="${CC}" \
		COMPONENT_TYPE="lib-shared" \
		FLEX="${LOCALBASE}/bin/flex"

PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libwapcaplet.so

.include <bsd.port.mk>
