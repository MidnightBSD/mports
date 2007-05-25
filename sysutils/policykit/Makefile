# New ports collection makefile for:   PolicyKit
# Date Created:			01 May 2006
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/policykit/Makefile,v 1.1 2007/05/07 19:45:16 laffer1 Exp $
# $FreeBSD: ports/sysutils/policykit/Makefile,v 1.3 2006/11/04 19:13:32 marcus Exp $
#   $MCom: ports/sysutils/policykit/Makefile,v 1.12 2006/10/07 19:45:38 marcus Exp $
#

PORTNAME=	policykit
PORTVERSION=	0.1.20060514
PORTREVISION=	3
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://www.marcuscom.com/downloads/
DISTNAME=	PolicyKit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for controlling access to system-wide components
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-pid-file=/var/run/polkitd/polkitd.pid \
		--with-pam-include=system
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		GTKDOC="false"

USE_RC_SUBR=	polkitd
USE_GNOME_SUBR=	yes

.include <bsd.port.mk>

