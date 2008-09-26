# New ports collection makefile for:	mpc plugin for xfce4
# Date created:				12 July 2006
# Whom:					Martin Wilke (miwi@FreeBSD.org)
#
# $MidnightBSD$
# $FreeBSD: ports/audio/xfce4-mpc-plugin/Makefile,v 1.11 2008/06/06 13:07:10 edwin Exp $
#

PORTNAME=	xfce4-mpc-plugin
PORTVERSION=	0.3.3
CATEGORIES=	audio xfce
MASTER_SITES=	http://goodies.xfce.org/releases/${PORTNAME}/
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A mpc plugin for xfce
LICENSE=	other
#openbsd/isc variant license it's not bsd2/3/4

LIB_DEPENDS=	mpd.0:${PORTSDIR}/audio/libmpd

USE_GMAKE=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui libutil panel

.include <bsd.port.mk>
