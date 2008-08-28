# New ports collection makefile for:	gdl
# Date created:				24 July 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/gdl/Makefile,v 1.3 2008/06/14 16:59:59 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gdl/Makefile,v 1.29 2007/07/10 04:38:08 marcus Exp $
#

PORTNAME=	gdl
PORTVERSION=	0.7.11
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Components intended to be shared between GNOME development tools
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XLIB=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeui
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
