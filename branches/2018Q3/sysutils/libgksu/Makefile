# Created by: Jesse van den Kieboom <troplosti@orcaweb.cjb.net>
# $FreeBSD: head/sysutils/libgksu/Makefile 393444 2015-08-02 20:23:55Z kwm $
# $MidnightBSD$

PORTNAME=	libgksu
PORTVERSION=	2.0.12
CATEGORIES=	sysutils
MASTER_SITES=	http://people.debian.org/~kov/gksu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library providing su and sudo functionality

LICENSE=	lgpl

LIB_DEPENDS=	libgtop-2.0.so:${PORTSDIR}/devel/libgtop \
		libglade-2.0.so:${PORTSDIR}/devel/libglade2 \
		libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring \
		libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification
RUN_DEPENDS=	xauth:${PORTSDIR}/x11/xauth
# sudo is part of base system

USES=		gettext gmake libtool pathfix pkgconfig
USE_GNOME=	glib20 gconf2 intltool
USE_LDCONFIG=	yes
USE_XORG=	x11
CONFIGURE_ARGS=	--enable-gtk-doc=no
GNU_CONFIGURE=	yes
GCONF_SCHEMAS=	gksu.schemas
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} '/AM_CFLAGS/s/-g -O2//' \
		${WRKSRC}/gksu-properties/Makefile.in \
		${WRKSRC}/libgksu/Makefile.in \
		${WRKSRC}/libgksuui/Makefile.in
	@${REINPLACE_CMD} '/^test_gksu_LDFLAGS =/s/glib-2.0/gtk+-2.0/' \
		${WRKSRC}/libgksu/Makefile.in
	@${REINPLACE_CMD} '/^libgksuui1_0_la_LIBADD =/s/$$/ -lX11/' \
		${WRKSRC}/libgksuui/Makefile.in

.include <bsd.port.mk>
