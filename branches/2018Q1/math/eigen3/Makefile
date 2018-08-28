# $MidnightBSD$

PORTNAME=	eigen
PORTVERSION=	3.2.2
CATEGORIES=	math
MASTER_SITES=	https://bitbucket.org/${PORTNAME}/${PORTNAME}/get/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	multi

USES=		cmake:outsource tar:bzip2
CMAKE_ENV+=	PKG_CONFIG_LIBDIR="${LOCALBASE}/libdata"
CONFIGURE_ENV+=       PKG_CONFIG_LIBDIR="${PREFIX}/libdata"
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTNAME}-1306d75b4a21

.include <bsd.port.mk>
