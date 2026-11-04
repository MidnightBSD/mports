PORTNAME=	xfce4-fsguard-plugin
PORTVERSION=	1.2.0
CATEGORIES=	sysutils xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Panel plugin which displays free space of mountpoint
WWW=		https://docs.xfce.org/panel-plugins/xfce4-fsguard-plugin/start

# COPYING file is wrong compared to license header
LICENSE=	bsd2

USES=		compiler:c11 gettext-tools gnome meson pkgconfig tar:xz xfce \
		xorg
USE_GNOME=	gdkpixbuf gtk30
USE_XFCE=	libmenu panel
USE_XORG=	x11
INSTALLS_ICONS=	yes

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime

post-patch-NLS-off:
	@${REINPLACE_CMD} -e "/^subdir('po')/d" ${WRKSRC}/meson.build

.include <bsd.port.mk>
