# $MidnightBSD: mports/www/linux-f10-flashplugin10/Makefile,v 1.2 2011/08/31 02:40:17 laffer1 Exp $
# $FreeBSD: ports/www/linux-f10-flashplugin10/Makefile,v 1.15 2011/03/24 18:40:34 nox Exp $

PORTNAME=	flashplugin
PORTVERSION=	10.3r183.11
CATEGORIES=	www multimedia linux
MASTER_SITES=	http://fpdownload.macromedia.com/get/flashplayer/pdc/${PORTVERSION:C/r/./}/:plugin \
		ftp://ftp.ipt.ru/pub/download/:suplib \
		FREEBSD_LOCAL/nox:suplib
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
USE_GNOME=	desktopfileutils
INSTALLS_ICONS=	yes

RESTRICTED=	Redistribution not allowed
RESTRICTED_FILES=	${DISTFILES:Nlinux-f10-flashsupport*:C/:[^:]+$//}

NO_BUILD=	yes
WRKSRC=		${WRKDIR}

USE_NPAPI=	linux-*
NPAPI_FILES=	libflashplayer.so

CONFLICTS=	linux-flashplugin-7* linux-flashplugin-9* linux-f8-flashplugin10-*

post-patch:
	@${REINPLACE_CMD} -e 's|/usr|${PREFIX}|' -e '/^NotShowIn=KDE/d' ${WRKDIR}/usr/share/applications/flash-player-properties.desktop

post-install:
	@${INSTALL_PROGRAM} ${WRKDIR}/libflashsupport.so ${LINUXBASE}/usr/lib
	@${INSTALL_PROGRAM} ${WRKDIR}/usr/bin/flash-player-properties ${PREFIX}/bin
	${MKDIR} ${DESKTOPDIR}
	@${INSTALL_DATA} ${WRKDIR}/usr/share/applications/flash-player-properties.desktop ${DESKTOPDIR}
	@(cd ${WRKDIR}/usr/share/icons && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons)

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/linux-mplayer-plugin/Makefile.npapi"
.include <bsd.port.post.mk>
