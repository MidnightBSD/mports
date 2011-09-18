# $MidnightBSD: mports/multimedia/linux-realplayer/Makefile,v 1.6 2011/09/18 01:00:05 laffer1 Exp $

PORTNAME=	linux-helixplayer
DISTVERSION=	11.0.2.1743-20091006
CATEGORIES=	multimedia audio linux
MASTER_SITES=	https://helixcommunity.org/download.php/2955/:player
DISTFILES=	HelixPlayer-${DISTVERSION}.i586.rpm:player

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux HelixPlayer 11 from RealNetworks
LICENSE=	restricted

EXTRACT_DEPENDS=	rpm2cpio.pl:${PORTSDIR}/archivers/rpm2cpio

WRKSRC=		${WRKDIR}/opt/helix/HelixPlayer
ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX=	yes
USE_LINUX_APPS=	gtk2 xorglibs
RESTRICTED=	Redistribution not allowed
NO_BUILD=	yes
WANT_GNOME=	yes
FETCH_ARGS=	-pRr

RADIR=		${PREFIX}/lib/HelixPlayer
PLUGINSDIR=	${PREFIX}/lib/linux-mozilla/plugins
RABINDIR=	${PREFIX}/bin

.if defined(WITHOUT_NLS)
PLIST_SUB+=	NLS="@comment "
.else
PLIST_SUB+=	NLS="" LINUXBASE="${LINUXBASE}"
.endif

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/share/icons)
WITH_ICONS=	yes
PLIST_SUB+=	ICONS=""
.else
PLIST_SUB+=	ICONS="@comment "
.endif

.if ${HAVE_GNOME:Mgnomehier}!=""
WITH_GNOME=	yes
PLIST_SUB+=	GNOME=""
.else
PLIST_SUB+=	GNOME="@comment "
.endif

.if defined(WITH_ICONS) || defined(WITH_GNOME)
PLIST_SUB+=	X11=""
.else
PLIST_SUB+=	X11="@comment "
.endif

do-extract:
	@${MKDIR} ${WRKDIR}
	@set -x; for f in ${_DISTFILES}; do\
		cd ${WRKDIR}; rpm2cpio.pl ${DISTDIR}/$$f | \
		    ${CPIO} -idm --quiet; \
	done

post-patch:
	@${SED} 's|/usr/local|${LOCALBASE}|' \
		< ${FILESDIR}/hxplay > ${WRKSRC}/hxplay

do-install:
	@${MKDIR} ${RADIR}
	${MKDIR} ${PREFIX}/share/icons/hicolor/192x192/apps/
	${MKDIR} ${PREFIX}/share/icons/hicolor/16x16/apps/
	${INSTALL_DATA} ${WRKSRC}/LICENSE ${WRKSRC}/README ${RADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/hxplay.bin ${RADIR}
	${BRANDELF} -t Linux ${RADIR}/hxplay.bin
.for dir in codecs common plugins share/default share/hxplay
	@${MKDIR} ${RADIR}/${dir}
	${INSTALL_DATA} ${WRKSRC}/${dir}/* ${RADIR}/${dir}
.endfor

.if !defined(WITHOUT_NLS)
	@${MKDIR} ${RADIR}/share/locale
	${CP} -Rp ${WRKSRC}/share/locale/* ${RADIR}/share/locale
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${RADIR}/share/locale
.for c in de es fr hi it ja ko pl pt_BR zh_CN zh_TW
	${LN} -sf ${RADIR}/share/locale/${c}/player.mo \
		${LINUXBASE}/usr/share/locale/${c}/LC_MESSAGES/hxplay.mo
.endfor
.endif

	@${MKDIR} ${PLUGINSDIR}
	${INSTALL_DATA} ${WRKSRC}/mozilla/* ${PLUGINSDIR}

	@${MKDIR} ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/hxplay ${PREFIX}/bin

.if defined(WITH_ICONS)
. for size in 16x16 32x32 48x48 192x192
	${MKDIR} ${PREFIX}/share/icons/hicolor/${size}/apps
	${INSTALL_DATA} ${WRKSRC}/share/icons/hxplay_${size}.png \
		${PREFIX}/share/icons/hicolor/${size}/apps
. endfor
. for size in 48x48 192x192
	@${MKDIR} ${PREFIX}/share/icons/hicolor/${size}/mimetypes
	${INSTALL_DATA} ${WRKSRC}/share/icons/mime-*_${size}.png \
		${PREFIX}/share/icons/hicolor/${size}/mimetypes
. endfor
.endif

.if defined(WITH_GNOME)
	${MKDIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/share/hxplay.png \
		${PREFIX}/share/pixmaps

	${MKDIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/share/hxplay.desktop \
		${PREFIX}/share/applications

	${MKDIR} ${PREFIX}/share/application-registry
	${INSTALL_DATA} ${WRKSRC}/share/hxplay.applications \
		${PREFIX}/share/application-registry

	${MKDIR} ${PREFIX}/share/mime-info
	${INSTALL_DATA} ${WRKSRC}/share/hxplay.keys ${WRKSRC}/share/hxplay.mime \
		${PREFIX}/share/mime-info
.endif

.include <bsd.port.post.mk>
