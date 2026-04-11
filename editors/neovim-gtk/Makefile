PORTNAME=	neovim-gtk
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.4
CATEGORIES=	editors

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Neovim client library and GTK4 GUI
WWW=		https://github.com/Lyude/neovim-gtk

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libgraphene-1.0.so:graphics/graphene
RUN_DEPENDS=	neovim>=0:editors/neovim

USES=		cargo pkgconfig gnome desktop-file-utils
USE_GNOME=	atk pango gtk40 glib20
USE_GITHUB=	yes
GH_ACCOUNT=	Lyude

post-install:
	( cd ${WRKSRC} && ${COPYTREE_SHARE} runtime ${PREFIX}/share/nvim-gtk )
	${MKDIR} ${PREFIX}/share/applications
	${SED} -e "s|Exec=nvim-gtk|Exec=${PREFIX}/bin/nvim-gtk|" ${WRKSRC}/desktop/org.daa.NeovimGtk.desktop >${PREFIX}/share/applications/org.daa.NeovimGtk.desktop
	${MKDIR} ${PREFIX}/share/icons/hicolor/128x128/apps/
	${INSTALL_DATA} ${WRKSRC}/desktop/org.daa.NeovimGtk_128.png ${PREFIX}/share/icons/hicolor/128x128/apps/org.daa.NeovimGtk.png
	${MKDIR} ${PREFIX}/share/icons/hicolor/48x48/apps/
	${INSTALL_DATA} ${WRKSRC}/desktop/org.daa.NeovimGtk_48.png ${PREFIX}/share/icons/hicolor/48x48/apps/org.daa.NeovimGtk.png
	${MKDIR} ${PREFIX}/share/icons/hicolor/scalable/apps/
	${INSTALL_DATA} ${WRKSRC}/desktop/org.daa.NeovimGtk.svg ${PREFIX}/share/icons/hicolor/scalable/apps/
	${MKDIR} ${PREFIX}/share/icons/hicolor/symbolic/apps/
	${INSTALL_DATA} ${WRKSRC}/desktop/org.daa.NeovimGtk-symbolic.svg ${PREFIX}/share/icons/hicolor/symbolic/apps/

.include <bsd.port.mk>
