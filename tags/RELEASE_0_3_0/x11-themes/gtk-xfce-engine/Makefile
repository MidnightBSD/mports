# New ports collection makefile for:	gtk-xfce-engine
# Date Created:				10 October 2002
# Whom:				 	olgeni@FreeBSD.org
#
# $MidnightBSD: mports/x11-themes/gtk-xfce-engine/Makefile,v 1.1 2008/09/26 18:20:04 laffer1 Exp $
# $FreeBSD: ports/x11-themes/gtk-xfce-engine/Makefile,v 1.46 2008/06/06 14:14:26 edwin Exp $
#

PORTNAME=	gtk-xfce-engine
PORTVERSION=	2.6.0
CATEGORIES=	x11-themes xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An XFCE engine for GTK 2.0
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GNOME=	glib20 gnomehack gtk20 pkgconfig
USE_XFCE=	configenv	# to get MASTER_SITE_SUBDIR something has to be defined

.include <bsd.port.mk>
