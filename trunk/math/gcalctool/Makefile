# New ports collection makefile for:	gcalctool
# Date created:				12 Jun 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/math/gcalctool/Makefile,v 1.4 2008/06/07 13:42:45 laffer1 Exp $
# $FreeBSD: ports/math/gcalctool/Makefile,v 1.63 2007/05/19 20:14:58 flz Exp $
#   $MCom: ports/math/gcalctool/Makefile,v 1.65 2007/03/12 19:02:22 mezz Exp $
#

PORTNAME=	gcalctool
PORTVERSION=	5.22.2
PORTREVISION=	1
PORTEPOCH=	2
CATEGORIES=	math gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\.([0-9]+).*/\1.\2/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME 2 calculator tool based on the old calctool for OpenWindows
LICENSE=	gpl2

USE_BZIP2=	yes
USE_BISON=	build
INSTALLS_OMF=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gnomedocutils libglade2
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gcalctool.1
GCONF_SCHEMAS=	gcalctool.schemas

.include <bsd.port.mk>
