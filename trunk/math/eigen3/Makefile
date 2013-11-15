# $MidnightBSD$

PORTNAME=	eigen
PORTVERSION=	3.2.0
CATEGORIES=	math
MASTER_SITES=	https://bitbucket.org/${PORTNAME}/${PORTNAME}/get/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math

LICENSE=	lgpl2.1

USE_BZIP2=	yes
USES=		cmake:outsource
CMAKE_ENV+=	PKG_CONFIG_LIBDIR="${LOCALBASE}/libdata"
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTNAME}-ffa86ffb5570

.include <bsd.port.mk>
