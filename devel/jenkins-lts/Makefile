PORTNAME=	jenkins
PORTVERSION=	2.504.3
CATEGORIES=	devel java
MASTER_SITES=	https://get.jenkins.io/war-stable/${PORTVERSION}/
PKGNAMESUFFIX=	-lts
DISTNAME=	jenkins
EXTRACT_SUFX=	.war
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source continuous integration server
WWW=		https://jenkins.io/

LICENSE=	mit

CONFLICTS=	jenkins-[0-9]*

USES=		cpe java
CPE_EDITION=	lts
JAVA_VERSION=	17+

NO_BUILD=	yes

USE_RC_SUBR=	jenkins

USES+=		cpe
CPE_VENDOR=	cloudbees
CPE_EDITION=	lts

JENKINS_HOME?=	${PREFIX}/jenkins
JENKINS_USER?=	jenkins
JENKINS_GROUP?=	jenkins
JENKINS_LOG_FILE?=	/var/log/jenkins.log

.if ${JENKINS_USER} == "jenkins"
USERS=	jenkins
.endif
.if ${JENKINS_GROUP} == "jenkins"
GROUPS=	jenkins
.endif

SUB_LIST+=	JENKINS_HOME=${JENKINS_HOME} \
		JENKINS_USER=${JENKINS_USER} \
		JENKINS_GROUP=${JENKINS_GROUP} \
		JAVA_HOME=${JAVA_HOME} \
		JENKINS_LOG_FILE=${JENKINS_LOG_FILE}
PLIST_SUB+=	JENKINS_USER=${JENKINS_USER} \
		JENKINS_GROUP=${JENKINS_GROUP}

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR} ${STAGEDIR}${JENKINS_HOME}
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} \
		${STAGEDIR}${DATADIR}

.include <bsd.port.post.mk>
