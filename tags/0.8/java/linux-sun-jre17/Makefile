# $MidnightBSD$

PORTNAME=	jre
PORTVERSION=	${JRE_VERSION}.${JRE_UPDATE_VERSION}
CATEGORIES=	java
MASTER_SITES=	#
PKGNAMEPREFIX=	linux-sun-
DISTNAME=	jre-7u${JRE_UPDATE_VERSION}-linux-i586

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle Java 7 Runtime Environment for Linux

LICENSE=	oracle_bin
LICENSE_NAME=	Oracle Binary Code License Agreement for Java SE
LICENSE_PERMS=
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	javavm:${PORTSDIR}/java/javavmwrapper

NO_CDROM=	License does not allow distribution with fee
RESTRICTED=	Redistribution of repackaged binaries not permitted

WRKSRC=		${WRKDIR}/jre${DL_JRE_VERSION}
PLIST_SUB+=	T=${APP_HOME:S/^${PREFIX}\///} PORTVERSION=${PORTVERSION}
PKGINSTALL=	${WRKDIR}/pkg-install

NO_BUILD=	yes
USE_LINUX=	f10
USE_LINUX_APPS=	xorglibs

JRE_VERSION=		7
JRE_INTERNAL_VERSION=	1.7.0
JRE_UPDATE_VERSION=	75
DL_JRE_VERSION=		${JRE_INTERNAL_VERSION}_${JRE_UPDATE_VERSION}
DOWNLOAD_URL=		http://www.oracle.com/technetwork/java/javase/downloads/index.html

APP_HOME=	${PREFIX}/${PKGNAMEPREFIX}${PORTNAME}${JRE_INTERNAL_VERSION}
SCRIPT_FILES=	bin/jcontrol
BIN_DIRS=	bin

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}) && !defined(PACKAGE_BUILDING)
IGNORE?=You must manually fetch the J2SE RE download for the Linux platform (${DISTNAME}${EXTRACT_SUFX}) from ${DOWNLOAD_URL}, place it in ${DISTDIR} and then run make again
.endif

post-patch:
.for script in ${SCRIPT_FILES}
	@${REINPLACE_CMD} -i.orig -e 's:^#!/bin/bash:#!/bin/sh:' ${WRKSRC}/${script}
.endfor
	@${FIND} ${WRKSRC} -name '*.orig' -delete

do-install:
	@${MKDIR} ${APP_HOME}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${APP_HOME}
.for dir in ${BIN_DIRS}
	@${CHOWN} -R ${BINOWN}:${BINGRP} "${APP_HOME}/${dir}"
	@${FIND} ${APP_HOME}/${dir} -type f -exec "${CHMOD}" ${BINMODE} "{}" \;
.endfor

post-install:
	@${SED} -e "s:%%JRE_HOME%%:${APP_HOME}:g" \
	  < ${FILESDIR}/pkg-install.in > ${PKGINSTALL}
	${MKDIR} ${STAGEDIR}${APP_HOME}/.systemPrefs
	${TOUCH} ${STAGEDIR}${APP_HOME}/.systemPrefs/.system.lock
	${TOUCH} ${STAGEDIR}${APP_HOME}/.systemPrefs/.systemRootModFile
	${CHMOD} 644 ${STAGEDIR}${APP_HOME}/.systemPrefs/.system.lock
	${CHMOD} 644 ${STAGEDIR}${APP_HOME}/.systemPrefs/.systemRootModFile

.include <bsd.port.post.mk>
