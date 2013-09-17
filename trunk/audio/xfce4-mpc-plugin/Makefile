# $MidnightBSD$

PORTNAME=	xfce4-mpc-plugin
PORTVERSION=	0.4.4
CATEGORIES=	audio xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=src/panel-plugins/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPC plugin for Xfce

LICENSE=	other

LIB_DEPENDS=	mpd:${PORTSDIR}/audio/libmpd

USES=		pkgconfig gettext
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gtk20 intltool intlhack
USE_XFCE=	configenv libexo libmenu panel

.include <bsd.port.mk>
