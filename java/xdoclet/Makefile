# $MidnightBSD: mports/java/xdoclet/Makefile,v 1.2 2009/05/23 00:01:11 laffer1 Exp $

PORTNAME=	xdoclet
PORTVERSION=	1.2.3
PORTEPOCH=	1
CATEGORIES=	java devel
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-bin-${PORTVERSION}
DISTFILES=	${DISTNAME}.zip xjavadoc-${XJAVADOC_VER}.zip

MAINTAINER=	ports@Midnight.org
COMMENT=	Java attribute-oriented code generation engine
LICENSE=	bsd4

RUN_DEPENDS=	${LOCALBASE}/bin/ant:${PORTSDIR}/devel/apache-ant

USE_JAVA=	yes
JAVA_VERSION=	1.5+
USE_ZIP=	yes
NO_WRKSUBDIR=	yes
NO_BUILD=	yes

XJAVADOC_VER=	1.1

PLIST_SUB+=	XJAVADOC_VER="${XJAVADOC_VER}"

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

do-install:
	cd ${WRKSRC}/xdoclet-${PORTVERSION} && ${FIND} lib -name '*xdoclet*' -exec \
	    ${INSTALL_DATA} \{} ${JAVAJARDIR} \;
	cd ${WRKSRC}/xdoclet-${PORTVERSION}/samples && ${FIND} . -type d -exec \
	    ${MKDIR} ${EXAMPLESDIR}/\{} \;
	cd ${WRKSRC}/xdoclet-${PORTVERSION}/samples && ${FIND} . -type f -exec \
	    ${INSTALL_DATA} \{} ${EXAMPLESDIR}/\{} \;
	${INSTALL_DATA} \
	    ${WRKSRC}/xjavadoc-${XJAVADOC_VER}/xjavadoc-${XJAVADOC_VER}.jar \
	    ${JAVAJARDIR}
.if !defined(NOPORTDOCS)
	cd ${WRKSRC}/xdoclet-${PORTVERSION}/docs && ${FIND} . -type d -exec \
	    ${MKDIR} ${DOCSDIR}/\{} \;
	cd ${WRKSRC}/xdoclet-${PORTVERSION}/docs && ${FIND} . -type f -exec \
	    ${INSTALL_DATA} \{} ${DOCSDIR}/\{} \;
.endif

.include <bsd.port.mk>
