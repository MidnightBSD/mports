# Created by: Olivier Duchateau

PORTNAME=	xfce4-whiskermenu-plugin
PORTVERSION=	2.5.3
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternate menu for the Xfce Desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake compiler:c++14-lang gettext-tools gnome localbase pkgconfig \
		tar:bzip2 xfce
USE_GNOME=	cairo gtk30
USE_XFCE=	panel

INSTALLS_ICONS=	yes

OPTIONS_DEFINE=	NLS

OPTIONS_SUB=	yes
NLS_USES=	gettext-runtime

post-patch-NLS-off:
	@${REINPLACE_CMD} '/add_subdirectory(po)/d' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>