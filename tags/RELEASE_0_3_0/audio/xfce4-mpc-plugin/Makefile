# New ports collection makefile for:	mpc plugin for xfce4
# Date created:				12 July 2006
# Whom:					Martin Wilke (miwi@FreeBSD.org)
#
# $MidnightBSD: mports/audio/xfce4-mpc-plugin/Makefile,v 1.1 2008/09/26 15:46:07 laffer1 Exp $
# $FreeBSD: ports/audio/xfce4-mpc-plugin/Makefile,v 1.11 2008/06/06 13:07:10 edwin Exp $
#

PORTNAME=	xfce4-mpc-plugin
PORTVERSION=	0.3.4
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
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui libutil panel

.include <bsd.port.mk>
