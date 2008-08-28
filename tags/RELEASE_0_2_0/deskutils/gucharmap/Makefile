# New ports collection makefile for:	gucharmap
# Date created:				02 Mar 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/deskutils/gucharmap/Makefile,v 1.3 2008/05/31 21:54:23 crash Exp $
# $FreeBSD: ports/deskutils/gucharmap/Makefile,v 1.33 2007/07/29 19:16:38 kris Exp $
#   $MCom: ports/deskutils/gucharmap/Makefile,v 1.35 2007/03/13 00:40:44 mezz Exp $
#

PORTNAME=	gucharmap
PORTVERSION=	2.22.1
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Unicode/ISO10646 character map and font viewer
LICENSE=	gpl2

LIB_DEPENDS=	rarian.0:${PORTSDIR}/textproc/rarian

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gtk20 gnomedocutils gconf2
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gucharmap.schemas

.include <bsd.port.mk>
