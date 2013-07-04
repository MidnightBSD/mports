# New ports collection makefile for:	gnome-mount
# Date created:			04 June 2006
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/gnome-mount/Makefile,v 1.3 2008/05/31 16:43:07 laffer1 Exp $
# $FreeBSD: ports/sysutils/gnome-mount/Makefile,v 1.9 2007/05/19 20:23:17 flz Exp $
#   $MCom: ports/sysutils/gnome-mount/Makefile,v 1.13 2007/02/11 06:03:50 marcus Exp $
#

PORTNAME=	gnome-mount
PORTVERSION=	0.8
PORTREVISIONN=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A front-end to mount, umount, and eject using HAL
LICENSE=	gpl2

LIB_DEPENDS=	hal.1:${PORTSDIR}/sysutils/hal \
		notify.1:${PORTSDIR}/devel/libnotify \
		gnome-keyring:${PORTSDIR}/security/gnome-keyring
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/polkit-gnome.pc:${PORTSDIR}/sysutils/policykit-gnome

USE_XORG=	x11
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gtk20
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-nautilus-extension
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-mount.schemas
MAN1=		gnome-mount.1
MLINKS=		gnome-mount.1 gnome-eject.1 \
		gnome-mount.1 gnome-umount.1


.include <bsd.port.mk>
