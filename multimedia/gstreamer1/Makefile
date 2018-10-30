# Created by: Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/multimedia/gstreamer1/Makefile 393429 2015-08-02 15:03:19Z tijl $

PORTNAME=	gstreamer
PORTVERSION=	1.12.3
CATEGORIES=	multimedia
MASTER_SITES=	GNOME \
		http://gstreamer.freedesktop.org/src/gstreamer/
PKGNAMESUFFIX=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Media applications framework

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

CFLAGS:=	${CFLAGS} -O2 -Wno-format
USES=		bison gettext gmake gnome libtool pathfix pkgconfig tar:xz \
		python:2
USE_GNOME=	glib20 introspection:build
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-tests \
		--disable-examples \
		--disable-failing-tests \
		--disable-fatal-warnings \
		--disable-gtk-doc
CONFIGURE_ENV=	ac_cv_func_register_printf_function="no"
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip
PLIST_SUB=	VERSION=${GST10_VERSION} \
		SOVERSION=0.1203.0
USE_LDCONFIG=	yes
GST10_VERSION=	1.0

.include <bsd.mport.options.mk>

.if ${ARCH} == i386 || ${ARCH} == amd64
LIB_DEPENDS+=	libunwind.so:devel/libunwind
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
