PORTNAME=	commons-collections
PORTVERSION=	3.2.2
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	APACHE_COMMONS_SOURCE
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Classes that extend/augment the Java Collections Framework
WWW=		https://commons.apache.org/proper/commons-collections/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		java:ant,run
JAVA_VERSION=	8 11 17 18

ALL_TARGET=	jar
NO_ARCH=	yes
PLIST_FILES=	${JAVAJARDIR}/${PORTNAME}.jar
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
