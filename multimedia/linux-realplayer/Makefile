# $MidnightBSD$
# $FreeBSD: ports/multimedia/linux-realplayer/Makefile,v 1.44 2006/03/27 19:06:35 mnag Exp $

PORTNAME=	linux-realplayer
DISTVERSION=	10.0.9.809-20070726
PORTREVISION=	2
CATEGORIES=	multimedia audio linux
MASTER_SITES=	ftp://ftp.tw.freebsd.org/pub/distfiles/:player \
		http://freeheimdall.spdns.org/files/:player \
		http://freeheimdall.spdns.org/files/:codecs \
		http://mirror.therek.net/freebsd/distfiles/mplayer/:codecs \
		SF/mplayer-tru/mplayer-codecs/20040704:codecs \
		ftp://fr2.rpmfind.net/linux/sourceforge/m/mp/mplayer-tru/mplayer-codecs/20040704/:codecs \

DISTFILES=	RealPlayer10GOLD.rpm:player \
		mplayer-codecs-linux-real-20040626-1.i386.rpm:codecs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux RealPlayer 10 from RealNetworks

LICENSE=	RealPlayer
LICENSE_NAME=	Helix DNA Technology Binary Research Use License
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	auto-accept

WRKSRC=		${WRKDIR}/usr/local/RealPlayer
ONLY_FOR_ARCHS=	i386 amd64
USES=		webplugin:linux
WEBPLUGIN_FILES=nphelix.so nphelix.xpt
USE_LINUX=	f10
USE_LINUX_APPS=	gtk2 xorglibs
RESTRICTED=	Redistribution not allowed
NO_BUILD=	yes

RADIR=		${PREFIX}/lib/RealPlayer
RABINDIR=	${PREFIX}/bin

OPTIONS_DEFINE=	GNOME ICONS NLS
OPTIONS_DEFAULT=	ICONS

ICONS_DESC=	Install set of icons

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS="" LINUXBASE="${LINUXBASE}"
.else
PLIST_SUB+=	NLS="@comment "
.endif

.if ${PORT_OPTIONS:MICONS}
PLIST_SUB+=	ICONS=""
.else
PLIST_SUB+=	ICONS="@comment "
.endif

.if ${PORT_OPTIONS:MGNOME}
USES+=		desktop-file-utils
PLIST_SUB+=	GNOME=""
.else
PLIST_SUB+=	GNOME="@comment "
.endif

.if ${PORT_OPTIONS:MICONS} || ${PORT_OPTIONS:MGNOME}
PLIST_SUB+=	X11=""
.else
PLIST_SUB+=	X11="@comment "
.endif

do-extract:
	@${MKDIR} ${WRKDIR}
	@for f in ${_DISTFILES}; do\
		cd ${WRKDIR}; ${TAR} -xf ${DISTDIR}/$$f ; \
	done

post-patch:
	@${SED} 's|/usr/local|${PREFIX}|' \
		< ${FILESDIR}/realplay > ${WRKSRC}/realplay

do-install:
	@${MKDIR} ${RADIR}
	${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${RADIR}
	${BRANDELF} -t Linux ${WRKSRC}/realplay.bin
	${INSTALL_PROGRAM} ${WRKSRC}/realplay.bin ${RADIR}
.for dir in codecs common lib plugins share/default share/realplay
	@${MKDIR} ${RADIR}/${dir}
	${INSTALL_DATA} ${WRKSRC}/${dir}/* ${RADIR}/${dir}
.endfor

# Extra codecs from the RealPlayer-9 -- no longer shipped by Real,
# but still in use by major content providers, such as Amazon:
.for c in dnet ddnt
	${INSTALL_DATA} ${WRKDIR}/usr/lib/codecs/$c.so.6.0 \
		${RADIR}/codecs/
	${LN} -sf $c.so.6.0 ${RADIR}/codecs/$c.so
.endfor

.if ${PORT_OPTIONS:MNLS}
	@${MKDIR} ${RADIR}/share/locale
	${CP} -Rp ${WRKSRC}/share/locale/* ${RADIR}/share/locale
.for c in de es fr hi it ja ko pl pt_BR zh_CN zh_TW
	@${MKDIR} ${LINUXBASE}/usr/share/locale/${c}/LC_MESSAGES
	${INSTALL_DATA} ${STAGEDIR}${RADIR}/share/locale/${c}/player.mo \
		${STAGEDIR}${LINUXBASE}/usr/share/locale/${c}/LC_MESSAGES/realplay.mo
.endfor
.endif

	@${MKDIR} ${WEBPLUGIN_DIR}
	${INSTALL_DATA} ${WRKSRC}/mozilla/* ${WEBPLUGIN_DIR}

	@${MKDIR} ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/realplay ${PREFIX}/bin

.if ${PORT_OPTIONS:MICONS}
. for size in 16x16 32x32 48x48 192x192
	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/icons/hicolor/${size}/apps
	${INSTALL_DATA} ${WRKSRC}/share/icons/realplay_${size}.png \
		${FAKE_DESTDIR}${LOCALBASE}/share/icons/hicolor/${size}/apps
. endfor
. for size in 48x48 192x192
	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/icons/hicolor/${size}/mimetypes
	${INSTALL_DATA} ${WRKSRC}/share/icons/mime-*_${size}.png \
		${FAKE_DESTDIR}${LOCALBASE}/share/icons/hicolor/${size}/mimetypes
. endfor
.endif

.if ${PORT_OPTIONS:MGNOME}
	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/share/realplay.png \
		${FAKE_DESTDIR}${LOCALBASE}/share/pixmaps

	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/applications
	${INSTALL_DATA} ${WRKSRC}/share/realplay.desktop \
		${FAKE_DESTDIR}${LOCALBASE}/share/applications

	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/application-registry
	${INSTALL_DATA} ${WRKSRC}/share/realplay.applications \
		${FAKE_DESTDIR}${LOCALBASE}/share/application-registry

	@${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/share/mime-info
	${INSTALL_DATA} ${WRKSRC}/share/realplay.keys ${WRKSRC}/share/realplay.mime \
		${FAKE_DESTDIR}${LOCALBASE}/share/mime-info
.endif

.include <bsd.port.mk>
