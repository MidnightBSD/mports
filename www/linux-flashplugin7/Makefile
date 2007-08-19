# New ports collection makefile for:	linux-flashplugin7
# Date created:				28 May 2004
# Whom:					Jamie Jones <jamie@bishopston.net>
#
# $MidnightBSD: mports/www/linux-flashplugin7/Makefile,v 1.1 2007/04/04 17:16:22 laffer1 Exp $
# $FreeBSD: ports/www/linux-flashplugin7/Makefile,v 1.21 2007/01/17 22:50:00 pav Exp $
#

PORTNAME=	flashplugin
PORTVERSION=	7.0r69
PORTREVISION=	0
CATEGORIES=	www multimedia linux
MASTER_SITES=	http://fpdownload.macromedia.com/get/flashplayer/current/
PKGNAMEPREFIX=	linux-
DISTNAME=	install_flash_player_7_linux
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe Flash Player NPAPI Plugin
LICENSE=	restricted

ONLY_FOR_ARCHS=	amd64 i386
USE_LINUX=	yes

RESTRICTED=	Redistribution not allowed

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/install_flash_player_7_linux
LATEST_LINK=	flash7
PORTDOCS=	Readme.txt

USE_NPAPI=	linux-*
NPAPI_FILES=	libflashplayer.so flashplayer.xpt

CONFLICTS=	linux-flashplugin-9*

post-install:
.ifndef NOPORTDOCS
	@${INSTALL} -d ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/linux-mplayer-plugin/Makefile.npapi"
.include <bsd.port.post.mk>
