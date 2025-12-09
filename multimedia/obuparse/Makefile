PORTNAME=	obuparse
DISTVERSIONPREFIX=	v
DISTVERSION=	2.0.1
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple and portable single file AV1 OBU parser
WWW=		https://github.com/dwbuiten/obuparse

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	dwbuiten

PLIST_FILES=	include/obuparse.h \
		lib/libobuparse.so \
		lib/libobuparse.so.2 \
		lib/libobuparse.so.${DISTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|%%DISTVERSION%%|${DISTVERSION}|g' \
	    ${PATCH_WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
