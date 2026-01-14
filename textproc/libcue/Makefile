PORTNAME=	libcue
PORTVERSION=	2.3.0
DISTVERSIONPREFIX=	v
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CUE Sheet Parser Library

LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex

USE_GITHUB=	yes
GH_ACCOUNT=	lipnitsk

USE_LDCONFIG=	yes
USES=		bison cmake pathfix
CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=1
PLIST_SUB=	SOVERSION=${PORTVERSION}

.include <bsd.port.mk>
