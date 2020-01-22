# $MidnightBSD$

PORTNAME=	bouncycastle
PORTVERSION=	1.45
PORTREVISION=	0
CATEGORIES=	java security
MASTER_SITES=	http://downloads.bouncycastle.org/java/ \
		http://polydistortion.net/bc/download/ \
		http://bouncycastle.gva.es/download/
DISTNAME=	crypto-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cleanroom build of Java Cryptography Extensions

LICENSE=	mit

BUILD_DEPENDS=	${JAVALIBDIR}/activation.jar:${PORTSDIR}/java/jaf \
		${JAVALIBDIR}/mail.jar:${PORTSDIR}/java/javamail \
		${JAVALIBDIR}/junit.jar:${PORTSDIR}/java/junit
RUN_DEPENDS=	${JAVALIBDIR}/activation.jar:${PORTSDIR}/java/jaf \
		${JAVALIBDIR}/mail.jar:${PORTSDIR}/java/javamail

CPE_PRODUCT=	legion-of-the-bouncy-castle-java-crytography-api
CPE_VENDOR=	${PORTNAME}
USES=		cpe
USE_JAVA=	yes
JAVA_VERSION=	1.6+
JDKMVERSION=	1.6 # ${JAVA_PORT_VERSION:C/^([0-9]\.[0-9])(.*)$/\1/}
JDKNVERSION=	16 # ${JAVA_PORT_VERSION:C/^([0-9])\.([0-9])(.*)$/\1\2/}
USE_ANT=	yes
MAKE_ENV=	ANT_INCLUDE_SHARED_JARS=YES
MAKE_ARGS=	-f jdk${JDKNVERSION}.xml
ALL_TARGET=	build-provider build zip-src
DISTVERSION=	${PORTVERSION:S/.//}

JARS=		bcprov bcmail bctsp bcpg

PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} s/BERConstructedOctetString/DEROctetString/ \
		${WRKSRC}/src/org/bouncycastle/cms/CMS*DataGenerator.java
	@${REINPLACE_CMD} 's/<javac/<javac encoding="UTF-8"/;s/<javadoc/<javadoc encoding="UTF-8"/' \
		${WRKSRC}/bc-build.xml ${WRKSRC}/common.xml

do-install:
	@${MKDIR} ${DATADIR}
.for jar in ${JARS}
	${INSTALL_DATA} ${WRKSRC}/build/artifacts/jdk${JDKMVERSION}/jars/${jar}-jdk${JDKNVERSION}-${DISTVERSION}.jar \
	      ${JAVAJARDIR}/${jar}.jar
	${INSTALL_DATA} ${WRKSRC}/build/artifacts/jdk${JDKMVERSION}/${jar}-jdk${JDKNVERSION}-${DISTVERSION}/src.zip \
	      ${DATADIR}/${jar}-src.zip
.endfor
	${INSTALL_DATA} ${WRKSRC}/jars/bcprov-jdk${JDKNVERSION}-${DISTVERSION}.jar \
		${JAVAJARDIR}/bcprov.jar
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.html ${DOCSDIR}
.for jar in ${JARS}
	@${MKDIR} ${DOCSDIR}/${jar}
	@cd ${WRKSRC}/build/artifacts/jdk${JDKMVERSION}/${jar}-jdk${JDKNVERSION}-${DISTVERSION}/docs/ && \
		${COPYTREE_SHARE} . ${DOCSDIR}/${jar}
.endfor
.endif

.include <bsd.port.mk>
