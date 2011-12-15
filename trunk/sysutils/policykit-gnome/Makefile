# New ports collection makefile for:   PolicyKit-gnome
# Date Created:			20 January 2008
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/policykit-gnome/Makefile,v 1.3 2010/12/31 12:21:40 laffer1 Exp $
# $FreeBSD: ports/sysutils/policykit-gnome/Makefile,v 1.3 2008/05/01 00:57:08 marcus Exp $
#   $MCom: ports/sysutils/policykit-gnome/Makefile,v 1.4 2008/02/15 16:48:08 mezz Exp $
#

PORTNAME=	policykit-gnome
PORTVERSION=	0.9.2
PORTREVISION=	5
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/
DISTNAME=	PolicyKit-gnome-${PORTVERSION}

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	GNOME frontend to the PolicKit framework
LICENSE=	gpl2
# lgpl + gpl2.. pick the worst

LIB_DEPENDS=	polkit.2:${PORTSDIR}/sysutils/policykit

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomehack  intlhack gnomedocutils gconf2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--localstatedir=/var
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	polkit-gnome.schemas

.include <bsd.port.mk>
