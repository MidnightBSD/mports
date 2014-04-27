# $MidnightBSD$

PORTNAME=	junit
PORTVERSION=	4.11
CATEGORIES=	java devel
MASTER_SITES=	GH
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A regression testing utility for use with the Java(TM) Language

LICENSE=	other

USE_GITHUB=	yes
GH_ACCOUNT=	junit-team
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	r${PORTVERSION}

USES=		perl5
USE_JAVA=	yes
USE_ANT=	yes

WRKSRC=		${WRKDIR}/junit-team-junit-c62e2df

PORTDOCS=	README.html cpl-v10.html doc javadoc
PORTEXAMPLES=	*
DATADIR=	${JAVASHAREDIR}/${PORTNAME}
PLIST_FILES=	%%JAVAJARDIR%%/junit.jar %%DATADIR%%/src.jar
PLIST_DIRS=	%%DATADIR%%

do-install:
	${INSTALL_DATA} ${INSTALL_WRKSRC}/junit${PORTVERSION}-SNAPSHOT/junit-${PORTVERSION}-SNAPSHOT.jar \
		 ${JAVAJARDIR}/junit.jar
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${INSTALL_WRKSRC}/junit${PORTVERSION}-SNAPSHOT/junit-${PORTVERSION}-SNAPSHOT-src.jar \
		${DATADIR}/src.jar
	cd ${INSTALL_WRKSRC}/junit${PORTVERSION}-SNAPSHOT/junit/samples \
		&& ${COPYTREE_SHARE} . ${EXAMPLESDIR}/
	cd ${INSTALL_WRKSRC} \
		&& ${FIND} ${PORTDOCS:Njavadoc} -type d -exec ${MKDIR} ${DOCSDIR}/\{} \; \
		&& ${FIND} ${PORTDOCS:Njavadoc} -type f -exec ${INSTALL_DATA} \{} ${DOCSDIR}/\{} \;
	cd ${INSTALL_WRKSRC}/junit${PORTVERSION}-SNAPSHOT \
		&& ${FIND} javadoc -type d -exec ${MKDIR} ${DOCSDIR}/\{} \; \

.include <bsd.port.mk>
