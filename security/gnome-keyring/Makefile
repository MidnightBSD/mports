# New ports collection makefile for:   gnomekeyring
# Date Created:			08 December 2003
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/security/gnome-keyring/Makefile,v 1.4 2009/05/23 16:28:26 laffer1 Exp $
# $FreeBSD: ports/security/gnome-keyring/Makefile,v 1.32 2008/04/07 04:20:38 marcus Exp $
#   $MCom: ports/security/gnome-keyring/Makefile,v 1.59 2008/03/09 18:30:40 mezz Exp $
#

PORTNAME=	gnome-keyring
PORTVERSION=	2.22.1
PORTREVISION=	2
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program that keeps passwords and other secrets
LICENSE=	gpl2

LIB_DEPENDS=	hal.1:${PORTSDIR}/sysutils/hal \
		tasn1.4:${PORTSDIR}/security/libtasn1 \
    		gcrypt.16:${PORTSDIR}/security/libgcrypt

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gtk20 ltverhack intlhack gconf2
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
GCONF_SCHEMAS=	gnome-keyring.schemas

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/dbus-1/services/

.include <bsd.port.mk>
