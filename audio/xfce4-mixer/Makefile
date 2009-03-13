# New ports collection makefile for:	xfce4-mixer
# Date created:		3 July 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/audio/xfce4-mixer/Makefile,v 1.1 2008/09/26 15:46:07 laffer1 Exp $
# $FreeBSD: ports/audio/xfce4-mixer/Makefile,v 1.45 2008/06/06 13:07:09 edwin Exp $
#

PORTNAME=	xfce4-mixer
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	audio xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 volume mixer module for xfce4-panel
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GSTREAMER=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack libxml2 pkgconfig
USE_XFCE=	configenv libgui libutil xfconf panel
USE_XORG=	xproto x11 xrender xext xinerama xrandr xcursor xcomposite \
		xdamage xfixes xi xau xdmcp

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|g' ${WRKSRC}/configure

.include <bsd.port.mk>
