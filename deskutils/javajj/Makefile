PORTNAME=	javajj
PORTVERSION=	1.1
PORTREVISION=	3
CATEGORIES=	deskutils java
#MASTER_SITES=	http://www.justjournal.com/software/
#DISTFILES=	justjournal-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Just Journal for Java blogging app

LICENSE=	bsd2

BUILD_DEPENDS+=	mvn:java/maven \
		javavm:java/javavmwrapper
RUN_DEPENDS+=	javavm:java/javavmwrapper

USE_GITHUB=	yes
GH_ACCOUNT=	laffer1
GH_PROJECT=	justjournal-client-java

USES=		tar:bzip2
USE_JAVA=	yes

WRKSRC=		${WRKDIR}/justjournal-client-java-${PORTVERSION}

SUB_FILES=	${PORTNAME}.sh
PLIST_FILES+=	bin/${PORTNAME}
PLIST_FILES+=	%%JAVAJARDIR%%/javajj-1.1.jar

do-build:
	cd ${WRKSRC} && mvn clean compile package

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/target/javajj-1.1.jar ${JAVAJARDIR}/

.include <bsd.port.mk>
