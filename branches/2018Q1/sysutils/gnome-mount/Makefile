# $MidnightBSD$
# $FreeBSD: ports/sysutils/gnome-mount/Makefile,v 1.9 2007/05/19 20:23:17 flz Exp $

PORTNAME=	gnome-mount
PORTVERSION=	0.8
PORTREVISION=	3
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Front-end to mount, umount, and eject using HAL

LICENSE=	gpl2

LIB_DEPENDS=	libhal.so:${PORTSDIR}/sysutils/hal \
		libnotify.so:${PORTSDIR}/devel/libnotify \
		libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/polkit-gnome.pc:${PORTSDIR}/sysutils/policykit-gnome

USE_GNOME=	gnomeprefix intlhack gconf2 gtk20
USES=		gettext gmake pathfix pkgconfig iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-nautilus-extension
MAKE_ENV+=	ICONV=${ICONV_CMD}
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GCONF_SCHEMAS=	gnome-mount.schemas

.include <bsd.port.mk>
