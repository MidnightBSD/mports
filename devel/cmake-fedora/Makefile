PORTNAME=	cmake-fedora
PORTVERSION=	2.9.2
DISTVERSIONSUFFIX=	-modules-only
CATEGORIES=	devel
MASTER_SITES=	https://releases.pagure.org/cmake-fedora/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of cmake modules for fedora developers
WWW=		https://pagure.io/cmake-fedora

LICENSE=	bsd3

WRKSRC=		${WRKDIR}/Modules
NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/share/cmake/Modules
	${INSTALL_DATA} ${WRKSRC}/* ${PREFIX}/share/cmake/Modules

.include <bsd.port.mk>
