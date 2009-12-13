# New ports collection makefile for:	libwnck
# Date created:				12 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/libwnck/Makefile,v 1.6 2009/11/26 22:03:19 crash Exp $
# $FreeBSD: ports/x11-toolkits/libwnck/Makefile,v 1.53 2007/07/03 16:51:41 mezz Exp $
#   $MCom: ports/x11-toolkits/libwnck/Makefile,v 1.85 2007/03/12 23:15:43 marcus Exp $
#

PORTNAME=	libwnck
PORTVERSION=	2.26.2
PORTREVISION?=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library used for writing pagers and taskslists
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification

USE_GETTEXT=	yes
USE_XORG=	xres
USE_GMAKE=	yes
USE_GNOME=	gnomehack gtk20 ltverhack referencehack intlhack
USE_BISON=	build
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>

.endif
