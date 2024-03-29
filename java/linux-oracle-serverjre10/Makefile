PORTNAME=	serverjre
PORTVERSION=	${JRE_VERSION}.${JRE_UPDATE_VERSION}.${JRE_PATCH_VERSION}
CATEGORIES=	java
MASTER_SITES=	#
PKGNAMEPREFIX=	linux-${JRE_VENDOR}-
PKGNAMESUFFIX=	${JRE_VERSION}
DISTNAME=	serverjre-${JRE_VERSION}.${JRE_UPDATE_VERSION}.${JRE_PATCH_VERSION}_linux-x64_bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle Java ${JRE_VERSION} Server Runtime Environment for Linux
WWW=		https://www.oracle.com/java/

# Converted from RESTRICTED
LICENSE=	serverjre
LICENSE_NAME=	serverjre
LICENSE_TEXT=	Redistribution of repackaged binaries not permitted
LICENSE_PERMS=	auto-accept

ONLY_FOR_ARCHS=	amd64
RUN_DEPENDS=	javavm:java/javavmwrapper

WRKSRC=		${WRKDIR}/jdk-${DL_JRE_VERSION}
PLIST_SUB=	T=${APP_HOME:S/^${PREFIX}\///} PORTVERSION=${PORTVERSION}

NO_BUILD=	yes
USES=		linux:c7

JRE_VENDOR=		oracle
JRE_VERSION=		10
JRE_UPDATE_VERSION=	0
JRE_PATCH_VERSION=	1
.if ${JRE_PATCH_VERSION} == 0
.if ${JRE_UPDATE_VERSION} == 0
DL_JRE_VERSION=		${JRE_VERSION}
.else
DL_JRE_VERSION=		${JRE_VERSION}.${JRE_UPDATE_VERSION}
.endif
.else
DL_JRE_VERSION=		${JRE_VERSION}.${JRE_UPDATE_VERSION}.${JRE_PATCH_VERSION}
.endif
DOWNLOAD_URL=		http://www.oracle.com/technetwork/java/javase/downloads/index.html

APP_HOME=	${PREFIX}/${PKGNAMEPREFIX}${PORTNAME}${JRE_VERSION}
BIN_DIRS=	bin
LIB_DIRS=	${BIN_DIRS:S|bin$|lib|}
bash_CMD=	${SH}

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE?=You must manually fetch the J2SE RE download for the Linux platform (${DISTNAME}${EXTRACT_SUFX}) from ${DOWNLOAD_URL}, place it in ${DISTDIR} and then run make again
.endif

do-install:
	@${MKDIR} ${STAGEDIR}${APP_HOME}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${APP_HOME}

.include <bsd.port.post.mk>
