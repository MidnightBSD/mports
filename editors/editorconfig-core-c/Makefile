PORTNAME=	editorconfig-core-c
PORTVERSION=	0.12.9
DISTVERSIONPREFIX=	v
CATEGORIES=	editors

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	EditorConfig core library and executable written in C
WWW=		https://editorconfig.org/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	doxygen:devel/doxygen
LIB_DEPENDS=	libpcre2-8.so:devel/pcre2

USES=		cmake

USE_GITHUB=	yes
GH_ACCOUNT=	editorconfig

USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	py*-editorconfig

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		SHLIB_MAJOR=${PORTVERSION:C/\..+//} \
		SHLIB_VER=${PORTVERSION}

.include <bsd.port.mk>
