PORTNAME=	jai
PORTVERSION=	1.1.3
PORTREVISION=	2
CATEGORIES=	java graphics
MASTER_SITES=	http://download.java.net/media/${PORTNAME}/builds/release/${PORTVERSION:S/./_/g}/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/./_/g}-lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance image processing libraries for Java
WWW=		http://java.sun.com/products/java-media/jai/

LICENSE=	jai
LICENSE_NAME=	jai
LICENSE_FILE=	${WRKSRC}/LICENSE-jai.txt
LICENSE_PERMS=	auto-accept

USES=		cpe java zip
CPE_VENDOR=	oracle
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:S/./_/g}
NO_BUILD=	yes

SUB_FILES=	pkg-message
SUB_LIST=	TARGET_DIR=${TARGET_DIR}
PKGMESSAGE=	${WRKDIR}/pkg-message

RESTRICTED=	Redistribution is not permitted

DOWNLOAD_URL=	http://java.sun.com/products/java-media/jai/current.html

TARGET_DIR=	${JAVASHAREDIR}/${PORTNAME}
PLIST_SUB+=	T=${TARGET_DIR:S/^${PREFIX}\///}

PORTDOCS=	\
		COPYRIGHT-jai.txt \
		DISTRIBUTIONREADME-jai.txt \
		LICENSE-jai.txt \
		THIRDPARTYLICENSEREADME-jai.txt

OPTIONS_DEFINE=	DOCS

do-install:
# documentation
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}
# jars
	@${MKDIR} ${TARGET_DIR}
	@${INSTALL_DATA} ${WRKSRC}/lib/jai_codec.jar ${TARGET_DIR}
	@${INSTALL_DATA} ${WRKSRC}/lib/jai_core.jar ${TARGET_DIR}

.include <bsd.port.mk>
