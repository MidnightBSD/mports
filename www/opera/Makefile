# $MidnightBSD: mports/www/opera/Makefile,v 1.33 2012/01/28 05:06:37 laffer1 Exp $
# $FreeBSD: ports/www/opera/Makefile,v 1.103 2011/04/08 03:28:51 dinoex Exp $

PORTNAME=	opera
PORTVERSION=	${OPERA_VER}
PORTREVISION=	1
CATEGORIES=	www ipv6
MASTER_SITES=	ftp://ftp.opera.com/pub/opera/${MASTER_SITES_VER_PATH}/ \
		ftp://opera.inode.at/${MASTER_SITES_VER_PATH}/ \
		http://gd.tuwien.ac.at/infosys/browsers/opera/${MASTER_SITES_VER_PATH}/ \
		ftp://opera.ftp.fu-berlin.de/${MASTER_SITES_VER_PATH}/ \
		http://ftp.ntua.gr/pub/www/Opera/${MASTER_SITES_VER_PATH}/ \
		http://mirrors.dedipower.com/opera/${MASTER_SITES_VER_PATH}/ \
		ftp://ftp.tiscali.nl/pub/mirrors/opera/${MASTER_SITES_VER_PATH}/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,net/www/opera/${MASTER_SITES_VER_PATH}&,}/ 
DISTNAME=	${PORTNAME}-${OPERA_VER}-${OPERA_BUILD}.${ARCH}.freebsd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Blazingly fast, full-featured, standards-compliant browser
LICENSE=	opera

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig
BUILD_DEPENDS=	${LOCALBASE}/bin/update-mime-database:${PORTSDIR}/misc/shared-mime-info
RUN_DEPENDS=	${LOCALBASE}/bin/update-mime-database:${PORTSDIR}/misc/shared-mime-info

OPERA_VER?=	11.52
OPERA_BUILD?=	1100
MASTER_SITES_VER_PATH=	unix/${OPERA_VER:S/.//}

USE_XZ=		yes
USE_XORG=	x11 xext sm ice xft xrender
USE_GNOME=	desktopfileutils

MAN1=		opera.1 opera-widget-manager.1
MANCOMPRESSED=	yes

NO_BUILD=	yes

OPTIONS=	CUPS	"Enable support for printing (requires CUPS)"		on \
		VIDEO	"Enable support for HTML5 video (requires GStreamer)"	on \
		GTK	"Use GTK backend"	off \
		KDE4	"Use KDE4 backend"	off

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_CUPS)
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-client
.endif

.if !defined(WITHOUT_VIDEO)
USE_GSTREAMER+=	vorbis ogg theora good
.endif

.if defined(WITH_GTK)
INSTALLS_ICONS=	yes
USE_GNOME+=	gtk20
.endif

.if defined(WITH_KDE4)
USE_KDE4+=	kdelibs
.endif

.include <bsd.port.pre.mk>

ONLY_FOR_ARCHS=	i386 amd64

OPERA_ARCH=	${ARCH:S,i386,intel,}

.if ${OSVERSION} < 4006
IGNORE=		Only for MidnightBSD 0.4+
.endif

post-extract:
	@${MV} ${WRKSRC}/share/man ${WRKSRC}/man

do-install:
	@${MKDIR} ${DATADIR}/defaults
	@${INSTALL_MAN} ${WRKSRC}/man/man1/${PORTNAME}.1.gz ${MANPREFIX}/man/man1/
	@${INSTALL_MAN} ${WRKSRC}/man/man1/${PORTNAME}-widget-manager.1.gz ${MANPREFIX}/man/man1/
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/install
	@${REINPLACE_CMD} -e 's|share/man|man|g' ${WRKSRC}/install
	@(cd ${WRKSRC} && ./install --text --system --unattended)
#	@${REINPLACE_CMD} -e 's|/usr/X11R6/lib/browser_plugins|${LOCALBASE}/lib/browser_plugins/symlinks/opera|g' \
#		${DATADIR}/defaults/pluginpath.ini
#	@${RM} ${DATADIR}/defaults/pluginpath.ini.bak
	${CP} ${PREFIX}/lib/opera/operapluginwrapper ${PREFIX}/lib/opera/operapluginwrapper.freebsd
	@${INSTALL_SCRIPT} ${PATCHDIR}/operapluginwrapper ${PREFIX}/lib/opera/
#	-${LOCALBASE}/bin/update-desktop-database
#	-${LOCALBASE}/bin/update-mime-database ${LOCALBASE}/share/mime
	${REINPLACE_CMD} -e 's|${PREFIX}|${TRUE_PREFIX}|g;'    ${PREFIX}/bin/opera \
		${PREFIX}/bin/opera-widget-manager \
		${PREFIX}/bin/uninstall-opera \
		${PREFIX}/share/applications/opera-browser.desktop \
		${PREFIX}/share/applications/opera-widget-installer.desktop \
    		${PREFIX}/share/applications/opera-widget-manager.desktop

.include <bsd.port.post.mk>
