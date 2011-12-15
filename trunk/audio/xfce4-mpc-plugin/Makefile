# $MidnightBSD: mports/audio/xfce4-mpc-plugin/Makefile,v 1.3 2011/02/09 13:38:27 laffer1 Exp $
# $FreeBSD: ports/audio/xfce4-mpc-plugin/Makefile,v 1.11 2008/06/06 13:07:10 edwin Exp $

PORTNAME=	xfce4-mpc-plugin
PORTVERSION=	0.3.5
CATEGORIES=	audio xfce
MASTER_SITES=	http://archive.xfce.org/src/panel-plugins/${PORTNAME}/0.3/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A mpc plugin for xfce
LICENSE=	other
#openbsd/isc variant license it's not bsd2/3/4

LIB_DEPENDS=	mpd.2:${PORTSDIR}/audio/libmpd

USE_BZIP2=	yes
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	 gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui libutil panel

.include <bsd.port.mk>
