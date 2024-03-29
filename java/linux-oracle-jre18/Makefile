PORTNAME=	jre
PORTVERSION=	${JRE_VERSION}.${JRE_UPDATE_VERSION}
CATEGORIES=	java
MASTER_SITES=	#
PKGNAMEPREFIX=	linux-${JRE_VENDOR}-
DISTNAME=	jre-${JRE_VERSION}u${JRE_UPDATE_VERSION}-linux-${JAVA_DISTFILE_ARCH}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle Java ${JRE_VERSION} Runtime Environment for Linux


LICENSE=	jre
LICENSE_NAME=	jre
LICENSE_TEXT=	Redistribution of repackaged binaries not permitted
LICENSE_PERMS=	auto-accept

RUN_DEPENDS=	javavm:java/javavmwrapper

NO_CDROM=	License does not allow distribution with fee
RESTRICTED=	Redistribution of repackaged binaries not permitted
PKGNAMESUFFIX=	1${JRE_VERSION}

WRKSRC=		${WRKDIR}/jre${DL_JRE_VERSION}
PLIST_SUB=	T=${APP_HOME:S/^${PREFIX}\///} \
		PORTVERSION=${PORTVERSION}

NO_BUILD=	yes
USES=		cpe linux shebangfix
CPE_VENDOR=	oracle
USE_LINUX=	xorglibs
ONLY_FOR_ARCHS=	i386 amd64

JRE_VENDOR=		oracle
JRE_VERSION=		8
JRE_INTERNAL_VERSION=	1.${JRE_VERSION}.0
JRE_UPDATE_VERSION=	241
.if ${JRE_UPDATE_VERSION} == 0
DL_JRE_VERSION=		${JRE_INTERNAL_VERSION}
.elif ${JRE_UPDATE_VERSION} <= 9
DL_JRE_VERSION=		${JRE_INTERNAL_VERSION}_0${JRE_UPDATE_VERSION}
.else
DL_JRE_VERSION=		${JRE_INTERNAL_VERSION}_${JRE_UPDATE_VERSION}
.endif
DOWNLOAD_URL=		http://www.oracle.com/technetwork/java/javase/downloads/index.html

APP_HOME=	${PREFIX}/${PKGNAMEPREFIX}${PORTNAME}${JRE_INTERNAL_VERSION}
BIN_DIRS=	bin
LIB_DIRS=	${BIN_DIRS:S|bin$|lib|}
SHEBANG_FILES=	${BIN_DIRS:S|$|/jcontrol|}
bash_CMD=	${SH}

.include <bsd.port.pre.mk>

.if ${ARCH} == i386
PLIST_SUB+=		JAVA_ARCHLIBDIR="i386" \
			I386_ONLY="" \
			AMD64_ONLY="@comment "
JAVA_DISTFILE_ARCH=	i586
.else
PLIST_SUB+=		JAVA_ARCHLIBDIR="amd64" \
			I386_ONLY="@comment " \
			AMD64_ONLY=""
JAVA_DISTFILE_ARCH=	x64
.endif

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE?=You must manually fetch the J2SE RE download for the Linux platform (${DISTNAME}${EXTRACT_SUFX}) from ${DOWNLOAD_URL}, place it in ${DISTDIR} and then run make again
.endif

do-install:
	@${MKDIR} ${STAGEDIR}${APP_HOME}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${APP_HOME}
	@cd ${STAGEDIR}${APP_HOME} && \
	    ${CHMOD} ${BINMODE} ${BIN_DIRS:S|$|/*|} ${LIB_DIRS:S|$|/jexec|}

.include <bsd.port.post.mk>
