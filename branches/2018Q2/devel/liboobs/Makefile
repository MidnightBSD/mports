# $MidnightBSD$
# $FreeBSD: ports/devel/liboobs/Makefile,v 1.6 2008/06/06 13:21:28 edwin Exp $


PORTNAME=	liboobs
PORTVERSION=	3.0.0
PORTREVISION=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	portsMidnightBSD.org
COMMENT=	Wrapping library to the System Tools Backends

LICENSE=	gpl2

BUILD_DEPENDS=	system-tools-backends:${PORTSDIR}/sysutils/system-tools-backends
LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libhal.so:${PORTSDIR}/sysutils/hal
RUN_DEPENDS=	system-tools-backends:${PORTSDIR}/sysutils/system-tools-backends

GNU_CONFIGURE=	yes
USES=		gmake libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-hal
CPPFLAGS+=	-I${LOCALBASE}/include
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
