# New ports collection makefile for:	at-poke
# Date created:				24 Oct 2006
# Whom:					Marcus von Appen <mva@sysfault.org>
#
# $MidnightBSD: mports/accessibility/at-poke/Makefile,v 1.2 2008/02/22 02:29:38 laffer1 Exp $
# $FreeBSD: ports/accessibility/at-poke/Makefile,v 1.3 2007/10/24 23:34:38 marcus Exp $
#

PORTNAME=	at-poke
PORTVERSION=	0.2.3
PORTREVISION=	1
CATEGORIES=	accessibility gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility testing and poking tool
LICENSE=	gpl2

USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix libglade2 libgailgnome
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
