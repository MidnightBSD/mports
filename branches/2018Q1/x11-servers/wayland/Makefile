# Created by: kwm@FreeBSD.org
# $FreeBSD: head/x11-servers/wayland/Makefile 432415 2017-01-25 12:12:40Z bapt $
# $MidnightBSD$

# NOTE
# Changes made by kwm to use kevent instead of epoll
# are still in place. However, since libinput depends
# on libepoll-shim the simplest to do was to have Wayland
# also use it. Currently build will fail if epoll-shim
# is not available but can be built without epoll-shim
# if EPOLLSHIM_LIBS is cleared (configure.ac)
#
# TODO: Add condition for this in configure
#
# If we want to build Wayland with kwm's kevent patches
# and use epoll-shim for libinput we have to change it
# so that Wayland ignore epoll headers installed by
# epoll-shim.
# Maybe best is to use epoll-shim if it is good enough
# and keep diff with upstream minimal.

PORTNAME=	wayland
PORTVERSION=	1.12.0
CATEGORIES=	x11-servers
MASTER_SITES=	http://wayland.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSDBSD.org
COMMENT=	Wayland composite "server"

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS= libexpat.so:textproc/expat2 \
		libffi.so:devel/libffi \
		libepoll-shim.so:devel/libepoll-shim

CFLAGS+=	"-I${LOCALBASE}/include/libepoll-shim"

WITH_DEBUG=	1

USES=		autoreconf gmake libtool localbase pathfix pkgconfig tar:xz
USE_GNOME=	libxslt:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-documentation
INSTALL_TARGET=	install-strip

pre-patch: pathfix-pre-patch
.include <bsd.port.mk>
