# New ports collection makefile for:	libgtkhtml
# Date created:				2nd June 2000
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/www/libgtkhtml/Makefile,v 1.1 2007/09/01 07:23:09 laffer1 Exp $
# $FreeBSD: ports/www/libgtkhtml/Makefile,v 1.81 2007/05/19 20:25:07 flz Exp $
#   $MCom: ports/www/libgtkhtml/Makefile,v 1.39 2006/09/10 00:51:14 mezz Exp $
#

PORTNAME=	libgtkhtml
PORTVERSION=	2.11.1
PORTREVISION=	0
CATEGORIES=	www gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/2.11
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight HTML rendering/printing/editing engine

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libxslt gnomevfs2 gail ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=  libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
