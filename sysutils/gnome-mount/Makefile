# New ports collection makefile for:	gnome-mount
# Date created:			04 June 2006
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/gnome-mount/Makefile,v 1.1 2007/10/23 21:06:50 laffer1 Exp $
# $FreeBSD: ports/sysutils/gnome-mount/Makefile,v 1.9 2007/05/19 20:23:17 flz Exp $
#   $MCom: ports/sysutils/gnome-mount/Makefile,v 1.13 2007/02/11 06:03:50 marcus Exp $
#

PORTNAME=	gnome-mount
PORTVERSION=	0.6
PORTREVISIONN=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://people.freedesktop.org/~david/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A front-end to mount, umount, and eject using HAL
LICENSE=	gpl2

LIB_DEPENDS=	hal.1:${PORTSDIR}/sysutils/hal \
		notify.1:${PORTSDIR}/devel/libnotify

USE_XLIB=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack nautilus2
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-nautilus-extension
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-mount.schemas
MAN1=		gnome-mount.1

post-patch:
	@${REINPLACE_CMD} -e 's|0.5.8.1|0.5.8|g' \
	    	${WRKSRC}/configure

.include <bsd.port.mk>
