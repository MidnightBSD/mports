PORTNAME=	mdds
PORTVERSION=	3.1.0
CATEGORIES=	devel
#MASTER_SITES=	https://kohei.us/files/mdds/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-dimensional data index algorithm
WWW=		https://gitlab.com/mdds/mdds

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		tar:xz

USE_GITLAB=	yes
GL_ACCOUNT=	mdds

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_SUB+=	API_VERSION=${API_VERSION}

API_VERSION=	${PORTVERSION:R}

do-configure:
	@${SED} -e 's|@API_VERSION@|${API_VERSION}|' \
	    -e 's|@VERSION@|${PORTVERSION}|' \
	    -e 's|@includedir@|$${prefix}/include|' \
	    -e 's|@prefix@|${PREFIX}|' \
	    ${WRKSRC}/misc/mdds.pc.in > \
	    ${WRKSRC}/misc/mdds-${API_VERSION}.pc

do-install:
	${MKDIR} ${PREFIX}/include/mdds-${API_VERSION}/mdds
	(cd ${WRKSRC}/include && ${COPYTREE_SHARE} . \
	    ${PREFIX}/include/mdds-${API_VERSION})
	${FIND} ${PREFIX}/include/mdds-${API_VERSION} \
	    \( -name "*.orig" -or -name "Makefile.*" \) -delete
	${INSTALL_DATA} ${WRKSRC}/misc/mdds-${API_VERSION}.pc \
	    ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
