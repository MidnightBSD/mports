# $MidnightBSD$

PORTNAME=	xfce4-battery-plugin
PORTVERSION=	1.0.5
PORTREVISION=	1
CATEGORIES=	sysutils xfce
MASTER_SITES=	XFCE/src/panel-plugins/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Battery monitor panel plugin for Xfce4

LICENSE=	gpl2

SSP_UNSAFE=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip
USES=		alias gmake libtool pkgconfig gettext-tools xfce tar:bzip2
USE_GNOME=	gtk20 glib20 intltool intlhack
USE_XFCE=	panel

OPTIONS_DEFINE= NLS
OPTIONS_DEFAULT=        NLS
NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls
OPTIONS_SUB=	yes

.include <bsd.port.mk>
