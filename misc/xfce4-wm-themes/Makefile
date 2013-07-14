# $MidnightBSD: mports/misc/xfce4-wm-themes/Makefile,v 1.4 2011/12/15 00:57:50 laffer1 Exp $

PORTNAME=	xfce4-wm-themes
PORTVERSION=	4.10.0
PORTREVISION=	1
CATEGORIES=	misc xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/art/xfwm4-themes/${PORTVERSION:R}
DISTNAME=	xfwm4-themes-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce 4 window decoration themes for xfwm4
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_XFCE=	configenv	# to get MASTER_SITE_SUBDIR something has to be defined

.include <bsd.port.mk>
