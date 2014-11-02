# $MidnightBSD$
# $FreeBSD: ports/sysutils/polkit-gnome/Makefile,v 1.6 2010/05/31 02:01:06 ade Exp $

PORTNAME=	polkit-gnome
PORTVERSION=	0.102
PORTREVISION=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME frontend to the PolicyKit framework

LICENSE=	lgpl

LIB_DEPENDS=	libpolkit-gobject-1.so:${PORTSDIR}/sysutils/polkit

USES=		gettext gmake libtool:keepla pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix gtk20 intlhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-gtk=2.0 \
		--localstatedir=/var
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
