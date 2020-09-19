# $MidnightBSD$

PORTNAME=	je
PORTVERSION=	6.2.31
PORTREVISION=	1
CATEGORIES=	java databases
MASTER_SITES=	http://download.oracle.com/berkeley-db/	\
		http://download-east.oracle.com/berkeley-db/	\
		http://download-west.oracle.com/berkeley-db/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Berkeley DB Java Edition

LICENSE=	agpl

OPTIONS_DEFINE=	DOCS EXAMPLES

BUILD_DEPENDS=	${JAVALIBDIR}/junit.jar:${PORTSDIR}/java/junit

USE_JAVA=	yes
JAVA_VERSION=	1.7+
USE_ANT=	yes
MAKE_ENV+=	JAVALIBDIR="${JAVALIBDIR}"
MAKE_ARGS+=	-cp ${JAVALIBDIR}/junit.jar

PLIST_FILES=	%%JAVAJARDIR%%/je.jar

PORTDOCS=	*
PORTEXAMPLES=	*

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} "s,/usr/local,${PREFIX}," ${WRKSRC}/build.xml

do-install:
	${INSTALL_DATA} ${WRKSRC}/build/lib/je.jar ${STAGEDIR}${JAVAJARDIR}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@(cd ${WRKSRC}/docs/ && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
