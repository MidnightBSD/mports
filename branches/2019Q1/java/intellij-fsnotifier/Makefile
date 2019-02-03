# Created by: Tobias Kortkamp <t@tobik.me>
# $FreeBSD: head/java/intellij-fsnotifier/Makefile 412347 2016-04-01 14:08:37Z mat $
# $MidnightBSD$

PORTNAME=	intellij-fsnotifier
PORTVERSION=	20160221
CATEGORIES=	java devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replacement for IntelliJ's fsnotifier

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libinotify.so:${PORTSDIR}/devel/libinotify

USE_GITHUB=	yes
GH_ACCOUNT=	idea4bsd
GH_PROJECT=	fsnotifier
GH_TAGNAME=	a04fbff6e21d58fea7a3ed2a6a21e53cbef4b7af

WRKSRC=		${WRKDIR}/fsnotifier-${GH_TAGNAME}

USES=	compiler:c11

.include "${.CURDIR}/../intellij/common.mk"

PLIST_FILES=	intellij/bin/fsnotifier

do-install:
	${MKDIR} ${STAGEDIR}${IDEA_HOME}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/fsnotifier ${STAGEDIR}${IDEA_HOME}/bin

.include <bsd.port.mk>
