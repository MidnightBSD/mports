# New ports collection makefile for:   gnomekeyring
# Date Created:			08 December 2003
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/security/gnome-keyring/Makefile,v 1.26 2007/05/19 20:22:28 flz Exp $
#

PORTNAME=	gnome-keyring
PORTVERSION=	0.8.1
CATEGORIES=	security gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gnome-keyring-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program that keeps passwords and other secrets

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus

USE_BZIP2=	yes
USE_GNOME=	gnomehack gtk20
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-html-dir=${GNOME_HTML_DIR}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
