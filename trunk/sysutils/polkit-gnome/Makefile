# $MidnightBSD: mports/sysutils/polkit-gnome/Makefile,v 1.1 2010/12/31 12:19:37 laffer1 Exp $
# $FreeBSD: ports/sysutils/polkit-gnome/Makefile,v 1.6 2010/05/31 02:01:06 ade Exp $
#   $MCom: ports/sysutils/polkit-gnome/Makefile,v 1.10 2010/05/10 04:21:19 marcus Exp $
#

PORTNAME=	polkit-gnome
PORTVERSION=	0.99
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME frontend to the PolicKit framework
LICENSE=	gpl2

LIB_DEPENDS=	polkit-gobject-1.0:${PORTSDIR}/sysutils/polkit

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomehack gnomeprefix gtk20 intlhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--localstatedir=/var
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
