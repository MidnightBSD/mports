PORTNAME=	javamail
DISTVERSIONPREFIX=	${PORTNAME:tu}-
DISTVERSION=	1_6_2
CATEGORIES=	java mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference Implementation of JSR 919
WWW=		https://javaee.github.io/javamail/

LICENSE=	gpl2 cddl
LICENSE_COMB=	dual

BUILD_DEPENDS+=	javavm:java/javavmwrapper
RUN_DEPENDS+=	javavm:java/javavmwrapper

OPTIONS_DEFINE=	DOCS EXAMPLES

USES=		cpe java:ant,run
USE_GITHUB=	yes
GH_ACCOUNT=	javaee

CPE_VENDOR=	sun
JAVA_VERSION=	8
NO_ARCH=	yes

PLIST_FILES=	%%JAVAJARDIR%%/mail.jar

PORTDOCS=	*
PORTEXAMPLES=	*

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
ALL_TARGET=	all docs
.endif

do-install:
	@${ECHO_MSG} -n ">> Install JAR files in ${JAVAJARDIR}..."
	@${INSTALL_DATA} ${WRKSRC}/target/release/mail.jar ${STAGEDIR}${JAVAJARDIR}/
	@${ECHO_MSG} " [ DONE ]"
.if ${PORT_OPTIONS:MDOCS}
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@cd ${WRKSRC}/target/release && ${FIND} *.txt \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${STAGEDIR}${DOCSDIR} > /dev/null 2>&1
	@cd ${WRKSRC}/target/release/docs && ${FIND} *.txt javadocs \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${STAGEDIR}${DOCSDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	@${ECHO_MSG} -n ">> Installing samples in ${EXAMPLESDIR}..."
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	@cd ${WRKSRC}/demo && ${FIND} src \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${STAGEDIR}${EXAMPLESDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
