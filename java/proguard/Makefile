PORTNAME=	proguard
PORTVERSION=	7.0.0
CATEGORIES=	java devel
MASTER_SITES=	https://github.com/Guardsquare/proguard/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java class file shrinker, optimizer, and obfuscator
WWW=		https://www.guardsquare.com/en/products/proguard

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS EXAMPLES

USES=		java
NO_BUILD=	yes
NO_ARCH=	yes

SUB_FILES=	proguard.sh proguard-gui.sh retrace.sh

PORTDOCS=	*
PORTEXAMPLES=	*

post-extract:
	@${RMDIR} ${WRKSRC}/examples/android/.gradle/6.4/vcsMetadata-1

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/lib/*.jar ${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/proguard.sh ${PREFIX}/bin/proguard
	${INSTALL_SCRIPT} ${WRKDIR}/proguard-gui.sh ${PREFIX}/bin/proguard-gui
	${INSTALL_SCRIPT} ${WRKDIR}/retrace.sh ${PREFIX}/bin/retrace
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${DOCSDIR}/
	${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${EXAMPLESDIR}/

.include <bsd.port.mk>
