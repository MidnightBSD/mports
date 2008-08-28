# New ports collection makefile for:	oaf
# Date created:				1st June 2000
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/devel/oaf/Makefile,v 1.1 2007/10/27 17:21:15 laffer1 Exp $
# $FreeBSD: ports/devel/oaf/Makefile,v 1.33 2007/05/19 20:03:14 flz Exp $
#

PORTNAME=	oaf
PORTVERSION=	0.6.10
PORTREVISION=	6
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/oaf/0.6
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object Activation Framework for GNOME
LICENSE=	gpl2

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix gtk12 orbit libxml
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS= --enable-static --enable-shared \
		--disable-more-warnings
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl"
CONFIGURE_TARGET=	--target=${MACHINE_ARCH}-unknown-freebsd6.0

MAN1=	oafd.1

.include <bsd.port.mk>
