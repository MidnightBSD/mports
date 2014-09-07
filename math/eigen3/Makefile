# $MidnightBSD$

PORTNAME=	eigen
PORTVERSION=	3.2.1
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
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTNAME}-6b38706d90a9

.include <bsd.port.mk>
