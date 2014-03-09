# New ports collection makefile for:	mousepad
# Date created:		19 April 2006
# Whom:			Oliver Lehmann <oliver@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/editors/mousepad/Makefile,v 1.9 2008/06/06 13:25:52 edwin Exp $
#

PORTNAME=	mousepad
PORTVERSION=	0.2.16
PORTREVISION=	2
CATEGORIES=	editors xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=src/apps/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple xfce editor

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USES=		gmake pkgconfig
USE_GETTEXT=	yes
USE_GNOME=	gtk20 intltool intlhack desktopfileutils
USE_XFCE=	configenv libgui

.include <bsd.port.mk>
