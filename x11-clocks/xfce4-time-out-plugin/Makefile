# Created by: Martin Wilke (miwi@FreeBSD.org)

PORTNAME=	xfce4-time-out-plugin
PORTVERSION=	1.1.2
PORTREVISION=	1
CATEGORIES=	x11-clocks xfce
MASTER_SITES=	XFCE/panel-plugins
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time out plugin for Xfce

LICENSE=	gpl2

USES=		compiler:c11 gettext-tools gmake gnome libtool pkgconfig \
		tar:bzip2 xfce xorg
USE_GNOME=	cairo gtk30 intltool
USE_XFCE=	panel
USE_XORG=	x11

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

.include <bsd.port.mk>
