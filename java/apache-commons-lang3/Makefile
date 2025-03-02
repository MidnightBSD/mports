PORTNAME=	commons-lang3
PORTVERSION=	3.17.0
CATEGORIES=	java devel
MASTER_SITES=	APACHE_COMMONS_BINARIES/lang
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache library with helper utilities for the java.lang API
https://commons.apache.org/proper/commons-lang/

LICENSE=	apache2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USES=		java

NO_BUILD=	yes
NO_ARCH=	yes

JARFILE=	${PORTNAME}-${PORTVERSION}.jar
DESTJARFILE=	${PORTNAME}.jar
PLIST_FILES=	${JAVAJARDIR}/${JARFILE} \
		${JAVAJARDIR}/${DESTJARFILE}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS
DOCS_ALL_TARGET=	javadoc

do-install:
	${INSTALL_DATA} ${WRKSRC}/${JARFILE} ${JAVAJARDIR}
	${LN} -sf ${JARFILE} ${JAVAJARDIR}/${DESTJARFILE}

do-install-DOCS-on:
	(cd ${WRKSRC}/apidocs && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
