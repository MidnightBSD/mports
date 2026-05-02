# Created by: Johannes Meixner <johannes@perceivon.net>

PORTNAME=	sublime
PORTVERSION=	2.0.2
CATEGORIES=	editors linux
MASTER_SITES=	https://download.sublimetext.com/
DISTNAME=	Sublime%20Text%202.0.2
PKGNAMEPREFIX=	linux-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sophisticated text editor for code, markup and prose

LICENSE=        SUBLIMEHQ
LICENSE_NAME=   End User License Agreement
LICENSE_TEXT=	"Software is licensed for evaluation only.  Purchase a license for continued use."
LICENSE_PERMS=  dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

INSTALLS_ICONS=	yes
USES=		desktop-file-utils gnome linux tar:bzip2
USE_LINUX=	xorglibs gtk2
WRKSRC=		${WRKDIR}/"Sublime Text 2"

NO_BUILD=
SUB_FILES=	sublime

CONFLICTS_INSTALL=	linux-sublime3-[0-9]*

do-install:
	@${MKDIR} ${DATADIR}
	@${MKDIR} ${PREFIX}/share/icons/hicolor/16x16/apps/
	@${MKDIR} ${PREFIX}/share/icons/hicolor/32x32/apps/
	@${MKDIR} ${PREFIX}/share/icons/hicolor/48x48/apps/
	@${MKDIR} ${PREFIX}/share/icons/hicolor/128x128/apps/
	@${MKDIR} ${PREFIX}/share/icons/hicolor/256x256/apps/
	@${MKDIR} ${PREFIX}/share/applications
	@${INSTALL_DATA} ${FILESDIR}/sublime_text.desktop ${PREFIX}/share/applications
	@${INSTALL_DATA} ${WRKSRC}/Icon/16x16/sublime_text.png ${PREFIX}/share/icons/hicolor/16x16/apps/
	@${INSTALL_DATA} ${WRKSRC}/Icon/32x32/sublime_text.png ${PREFIX}/share/icons/hicolor/32x32/apps/
	@${INSTALL_DATA} ${WRKSRC}/Icon/48x48/sublime_text.png ${PREFIX}/share/icons/hicolor/48x48/apps/
	@${INSTALL_DATA} ${WRKSRC}/Icon/128x128/sublime_text.png ${PREFIX}/share/icons/hicolor/128x128/apps/
	@${INSTALL_DATA} ${WRKSRC}/Icon/256x256/sublime_text.png ${PREFIX}/share/icons/hicolor/256x256/apps/
	@${RM} -r ${WRKSRC}/Icon/
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${DATADIR}
	@${CHMOD} +x ${DATADIR}/sublime_text
	@${INSTALL_SCRIPT} ${WRKDIR}/sublime ${PREFIX}/bin/sublime

.include <bsd.port.mk>
