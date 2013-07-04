# $MidnightBSD: mports/www/linux-f10-flashplugin11/Makefile,v 1.3 2013/03/20 02:32:25 laffer1 Exp $

PORTNAME=	flashplugin
PORTVERSION=	11.2r202.291
CATEGORIES=	www multimedia linux
MASTER_SITES=	http://fpdownload.macromedia.com/get/flashplayer/pdc/${PORTVERSION:C/r/\./}/:plugin \
		FREEBSD_LOCAL/nox:suplib
PKGNAMEPREFIX=	linux-f10-
DISTFILES=	install_flash_player_11_linux.i386.tar.gz:plugin \
		linux-f10-flashsupport-9.0.1.i386.tar.gz:suplib
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe Flash Player NPAPI Plugin
LICENSE=	restricted

ONLY_FOR_ARCHS=	amd64 i386
USE_LINUX=	yes
USE_LINUX_APPS=	openssl curl cyrus-sasl2 libssh2 nspr nss openldap gtk2
WANT_GNOME=	yes

RESTRICTED=	Redistribution not allowed
RESTRICTED_FILES=	${DISTFILES:Nlinux-f10-flashsupport*:C/:[^:]+$//}

NO_BUILD=	yes
WRKSRC=		${WRKDIR}

USE_NPAPI=	linux-*
NPAPI_FILES=	libflashplayer.so

CONFLICTS=	linux-flashplugin-9* linux-f8-flashplugin10* linux-f10-flashplugin10*

OPTIONS_DEFINE=	GNOME
GNOME_DESC=	include gnome support for .desktop file

OPTIONS_SUB=	yes
GNOME_USES=	desktop-file-utils

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGNOME}
INSTALLS_ICONS=	yes
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr|${PREFIX}|' -e '/^NotShowIn=KDE/d' ${WRKDIR}/usr/share/applications/flash-player-properties.desktop

post-install:
	@${INSTALL_PROGRAM} ${WRKDIR}/libflashsupport.so ${LINUXBASE}/usr/lib
	@${INSTALL_PROGRAM} ${WRKDIR}/usr/bin/flash-player-properties ${PREFIX}/bin
	@${MKDIR} ${PREFIX}/share/applications/
	@${INSTALL_DATA} ${WRKDIR}/usr/share/applications/flash-player-properties.desktop ${DESKTOPDIR}
	@(cd ${WRKDIR}/usr/share/icons && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons)
	-@update-desktop-database

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/linux-mplayer-plugin/Makefile.npapi"
.include <bsd.port.post.mk>
