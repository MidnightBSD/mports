# Created by: Ernst de Haan <znerd@FreeBSD.org>

PORTNAME=	commons-collections
PORTVERSION=	3.2.2
CATEGORIES=	java devel
MASTER_SITES=	APACHE_COMMONS_SOURCE
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Classes that extend/augment the Java Collections Framework

LICENSE=	apache2

USES=		dos2unix

USE_JAVA=	yes
JAVA_VERSION=	8+
USE_ANT=	yes
DOS2UNIX_GLOB=	Multi*.java Test*.java

ALL_TARGET=	jar
PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar
OTHERDOCS=	DEVELOPERS-GUIDE.html PROPOSAL.html README.txt RELEASE-NOTES.txt
PORTDOCS=	apidocs ${OTHERDOCS}

OPTIONS_DEFINE=	DOCS

DOCS_ALL_TARGET=	javadoc

do-install:
	@${MKDIR} ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_DATA} ${WRKSRC}/build/${PORTNAME}-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/docs && \
		${COPYTREE_SHARE} apidocs ${FAKE_DESTDIR}${DOCSDIR})
	${INSTALL_DATA} ${OTHERDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
