PORTNAME=	gradle
PORTVERSION=	6.9.4
CATEGORIES=	devel java
MASTER_SITES=	https://downloads.gradle.org/distributions/
PKGNAMESUFFIX=	6
EXTRACT_SUFX=	-bin.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Project automation tool
WWW=		https://www.gradle.org/

LICENSE=	Apache-2.0 bsd3 cddl epl lgpl2.1+ mit MPL20
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe java zip

CONFLICTS_INSTALL=	gradle gradle62

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	gradle
SUB_LIST=	JAVA=${JAVA} \
		PORTVERSION=${PORTVERSION}
PLIST_FILES=	bin/gradle
PORTDATA=	*

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/gradle ${STAGEDIR}${PREFIX}/bin/gradle
	(cd ${WRKSRC} && ${COPYTREE_SHARE} lib ${STAGEDIR}${DATADIR})

.include <bsd.port.mk>
