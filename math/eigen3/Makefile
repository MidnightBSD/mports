PORTNAME=	eigen
DISTVERSION=	3.3.5
CATEGORIES=	math
MASTER_SITES=	https://bitbucket.org/${PORTNAME}/${PORTNAME}/get/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	multi
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LGPL
LICENSE_FILE_mpl=	${WRKSRC}/COPYING.MPL2

CMAKE_ARGS=	-DPKGCONFIG_INSTALL_DIR:PATH="${PREFIX}/libdata/pkgconfig"
USES=		cmake tar:bzip2
NO_BUILD=	yes
NO_ARCH=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTNAME}-b3f3d4950030

.include <bsd.port.mk>
