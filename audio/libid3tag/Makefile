PORTNAME=	libid3tag
PORTVERSION=	0.16.3
CATEGORIES=	audio
MASTER_SITES=	https://codeberg.org/tenacityteam/libid3tag/archive/${PORTVERSION}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ID3 tag manipulation library
WWW=		https://www.underbit.com/products/mad/ \
		https://codeberg.org/tenacityteam/libid3tag

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake cpe pathfix

CMAKE_ON=	BUILD_SHARED_LIBS
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/libid3tag

PLIST_SUB=	PORTVERSION=${PORTVERSION}

CPE_VENDOR=	libid3tag_project

PORTSCOUT=	skipv:1.00.0

.include <bsd.port.mk>
