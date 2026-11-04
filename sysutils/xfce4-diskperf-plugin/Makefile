PORTNAME=	xfce4-diskperf-plugin
PORTVERSION=	2.8.0
CATEGORIES=	sysutils xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical representation of the disk IO
WWW=		https://docs.xfce.org/panel-plugins/xfce4-diskperf-plugin/start

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext-tools gnome meson pkgconfig tar:xz xfce
USE_GNOME=	gtk-update-icon-cache gtk30
USE_XFCE=	libmenu panel

INSTALLS_ICONS=	yes

LDFLAGS+=	-ldevstat

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext-runtime

post-patch-NLS-off:
	@${REINPLACE_CMD} -e "/^subdir('po')/d" ${WRKSRC}/meson.build

.include <bsd.port.mk>
