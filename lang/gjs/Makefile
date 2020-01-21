# Created by: Pawel Worach <pawel.worach@gmail.com>

PORTNAME=	gjs
PORTVERSION=	1.52.4
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Javascript binding

LICENSE=	mpl gpl2 lgpl2.1 mit
LICENSE_COMB=	multi

LIB_DEPENDS=	libmozjs-52.so:lang/spidermonkey52 \
		libffi.so:devel/libffi

USES=		compiler:c++11-lib gettext gmake gnome libtool \
		localbase pathfix pkgconfig python:build readline tar:xz xorg
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection
USE_XORG=	x11 xext
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
CONFIGURE_ARGS+=--disable-profiler
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
