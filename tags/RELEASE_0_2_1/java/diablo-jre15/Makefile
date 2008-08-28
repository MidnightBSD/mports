# New ports collection makefile for:	diablo-jre15
# Date created:		February 26 2006
# Whom:			Greg Lewis <glewis@FreeBSD.org>
#
# $MidnightBSD: mports/java/diablo-jre15/Makefile,v 1.8 2008/03/21 23:08:31 laffer1 Exp $
# $FreeBSD: ports/java/diablo-jre15/Makefile,v 1.8 2007/03/07 17:14:46 glewis Exp $
#

PORTNAME=	jre
PORTVERSION=	${JRE_VERSION}.${RELEASE_VERSION}.${BUILD_VERSION}
PORTREVISION=	6
CATEGORIES=	java devel
MASTER_SITES=	#
PKGNAMEPREFIX=	diablo-
DISTNAME=	${PKGNAMEPREFIX}latte-${JRE_OSREL}-${ARCH}-${JRE_VERSION}_${RELEASE_VERSION}-b${BUILD_VERSION}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java Runtime Environment ${JRE_VERSION}_${RELEASE_VERSION}.${BUILD_VERSION}

# must fetch yourself
IS_INTERACTIVE= yes

BUILD_DEPENDS=	javavm:${PORTSDIR}/java/javavmwrapper
RUN_DEPENDS=	${BUILD_DEPENDS}

LICENSE=	restricted
RESTRICTED=	"License doesn't allow distribution with fee"

USE_BZIP2=	yes
USE_GCPIO=	yes
USE_XLIB=	yes
USE_XORG+=	xi xp xt xtst
ONLY_FOR_ARCHS=	i386 amd64
JRE_VERSION=	1.5.0
RELEASE_VERSION=07
BUILD_VERSION=	01
PLIST_SUB+=	JRE_VERSION=${JRE_VERSION}
PLIST_SUB+=	ARCH=${ARCH}
DOWNLOAD_URL=	http://www.FreeBSDFoundation.org/cgi-bin/download?download=${DISTNAME}${EXTRACT_SUFX}
LATEST_LINK=	${PKGNAMEPREFIX}${PORTNAME}15

WRKSRC=		${WRKDIR}/${PKGNAMEPREFIX}jre${JRE_VERSION}_${RELEASE_VERSION}
NO_BUILD=	yes

OPTIONS=	TZUPDATE	"Update the time zone data"	on

SUB_FILES+=	pkg-install \
		pkg-deinstall
PKG_IGNORE_DEPENDS=	'^[^x|^j]'

INSTALL_DIR=	${PREFIX}/${PKGNAMEPREFIX}jre${JRE_VERSION}

.include <bsd.port.pre.mk>

JRE_OSREL=freebsd6

.if !defined(WITHOUT_TZUPDATE)
EXTRACT_DEPENDS+=	unzip:${PORTSDIR}/archivers/unzip
TZUPDATE_VERSION=	1.3.3
TZUPDATE_TZVERSION=	2007k
TZUPDATEFILE=		tzupdater-${TZUPDATE_VERSION}-${TZUPDATE_TZVERSION}.zip
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${TZUPDATEFILE}
EXTRACT_ONLY=		${DISTNAME}${EXTRACT_SUFX}
PLIST_SUB+=		TZORIGINAL="@comment "
PLIST_SUB+=		TZUPDATE=""
.else
PLIST_SUB+=		TZORIGINAL=""
PLIST_SUB+=		TZUPDATE="@comment "
.endif

.if ${ARCH} == "i386"
PLIST_SUB+=	WEB=""
PLIST_SUB+=	CLIENTVM=""
.else
PLIST_SUB+=	WEB="@comment "
PLIST_SUB+=	CLIENTVM="@comment "
.endif

.if (!exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}) || (!defined(WITHOUT_TZUPDATE) && !exists(${DISTDIR}/${TZUPDATEFILE}))) && !defined(PACKAGE_BUILDING) && defined(JRE_OSREL)
ECHO_MSG=/usr/bin/printf
IGNORE=	:\n\
Because of licensing restrictions, you must fetch the distribution\n\
manually.\n
.if (!exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}))
IGNORE += Please access\n\
\n\
  ${DOWNLOAD_URL}\n\
\n\
with a web browser and \"Accept\" the End User License Agreement for\n\
\"Latte Diablo ${JRE_VERSION}\".  Please place the downloaded\n\
${DISTNAME}${EXTRACT_SUFX} in ${DISTDIR}.\n\n
.endif
.if !defined(WITHOUT_TZUPDATE) && !exists(${DISTDIR}/${TZUPDATEFILE})
IGNORE += Please open http://java.sun.com/javase/downloads/index.jsp\n\
in a web browser and follow the \"Download\" link for\n\
\"JDK US DST Timezone Update Tool - ${TZUPDATE_VERSION}\" to obtain the\n\
time zone update file, ${TZUPDATEFILE}.\n\n
.endif
.endif

.if !defined(WITHOUT_TZUPDATE)
post-extract:
	@${UNZIP_CMD} -qo ${DISTDIR}/${TZUPDATEFILE} -d ${WRKDIR}
	@# Update time zones
	@-${WRKSRC}/bin/java -jar \
		${WRKDIR}/tzupdater-${TZUPDATE_VERSION}-${TZUPDATE_TZVERSION}/tzupdater.jar -u -bc
	@${RM} -rf ${WRKSRC}/lib/zi.tzdata*
.endif

do-install:
	${MKDIR} "${INSTALL_DIR}"
	cd "${WRKSRC}" && ${FIND} . \
	  | ${CPIO} -pdmu -R ${LIBOWN}:${LIBGRP} "${INSTALL_DIR}"

post-install:
	${LOCALBASE}/bin/registervm "${LOCALBASE}/${PKGNAMEPREFIX}${PORTNAME}${JDK_VERSION}/bin/java # DiabloLatte${JRE_VERSION}"

	# Install the plugin
	${SETENV} PKG_PREFIX="${PREFIX}" ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.post.mk>
