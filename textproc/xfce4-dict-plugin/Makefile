# Created by: Oliver Lehmann (oliver@FreeBSD.org)

PORTNAME=	xfce4-dict
PORTVERSION=	0.8.10
CATEGORIES=	textproc xfce
MASTER_SITES=	XFCE/apps
PKGNAMESUFFIX=	-plugin
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightbSD.org
COMMENT=	Xfce4 plugin to query different dictionaries
WWW=		https://goodies.xfce.org/projects/applications/xfce4-dict

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext-tools gnome meson pkgconfig tar:xz xfce xorg
USE_GNOME=	gdkpixbuf glib20 gtk-update-icon-cache gtk30 intltool
USE_XFCE=	libmenu panel
USE_XORG=	x11

INSTALLS_ICONS=	yes

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext-runtime

post-patch-NLS-off:
	@${REINPLACE_CMD} -e "/^subdir('po')/d" ${WRKSRC}/meson.build

.include <bsd.port.mk>
