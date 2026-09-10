PORTNAME=	xfce4-stopwatch-plugin
PORTVERSION=	0.6.0
CATEGORIES=	x11-clocks xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFCE panel plugin to keep track of elapsed time
WWW=		https://docs.xfce.org/panel-plugins/xfce4-stopwatch-plugin/start

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext-tools gnome meson pkgconfig tar:xz xfce
USE_GNOME=	gtk-update-icon-cache gtk30
USE_XFCE=	libutil panel

INSTALLS_ICONS=	yes

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_USES=		gettext-runtime

post-patch-NLS-off:
	@${REINPLACE_CMD} -e "/^subdir('po')/d" ${WRKSRC}/meson.build

.include <bsd.port.mk>
