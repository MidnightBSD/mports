

PORTNAME=	e_dbus
PORTVERSION=	1.7.10
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://download.enlightenment.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	EFL DBUS connectivity library

LICENSE=	bsd2

LIB_DEPENDS=	libefl.so:${PORTSDIR}/devel/efl \
		libdbus-1.so:${PORTSDIR}/devel/dbus

DIST_SUBDIR=	enlightenment
GNU_CONFIGURE=	yes
USES=		libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--enable-ehal --disable-enotify --disable-eukit \
		--disable-econnman0_7x --disable-eofono --disable-ebluez \
		--disable-edbus-test --disable-edbus-test-client \
		--disable-edbus-async-test --disable-static

.include <bsd.port.mk>
