# $MidnightBSD$
# $FreeBSD: ports/www/linux-f10-flashplugin10/Makefile,v 1.15 2011/03/24 18:40:34 nox Exp $

PORTNAME=	flashplugin
PORTVERSION=	10.2r153
CATEGORIES=	www multimedia linux
MASTER_SITES=	http://fpdownload.macromedia.com/get/flashplayer/current/:plugin \
		ftp://ftp.ipt.ru/pub/download/:suplib
PKGNAMEPREFIX=	linux-f10-
DISTFILES=	install_flash_player_10_linux.tar.gz:plugin \
		linux-f10-flashsupport-9.0.1.i386.tar.gz:suplib
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe Flash Player NPAPI Plugin
LICENSE=	restricted

ONLY_FOR_ARCHS=	amd64 i386
USE_LINUX=	yes
USE_LINUX_APPS=	openssl curl cyrus-sasl2 libssh2 nspr nss openldap gtk2

RESTRICTED=	Redistribution not allowed
RESTRICTED_FILES=	${DISTFILES:Nlinux-f10-flashsupport*:C/:[^:]+$//}

NO_BUILD=	yes
WRKSRC=		${WRKDIR}

USE_NPAPI=	linux-*
NPAPI_FILES=	libflashplayer.so

CONFLICTS=	linux-flashplugin-7* linux-flashplugin-9*

post-install:
	@${INSTALL_PROGRAM} ${WRKDIR}/libflashsupport.so ${LINUXBASE}/usr/lib

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/linux-mplayer-plugin/Makefile.npapi"
.include <bsd.port.post.mk>
