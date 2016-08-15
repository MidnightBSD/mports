# $MidnightBSD$

PORTNAME=	vte
PORTVERSION=	0.28.2
PORTREVISION?=	2
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Terminal widget with improved accessibility and I18N support

LICENSE?=	lgpl

USES+=		tar:xz

.if !defined(REFERENCE_PORT)

RUN_DEPENDS+=	${LOCALBASE}/libexec/gnome-pty-helper:${PORTSDIR}/x11-toolkits/gnome-pty-helper

USES+=		cpe gettext gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GNOME?=	gnomeprefix gtk20 intltool introspection:build referencehack
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS?=--disable-python \
		--disable-Bsymbolic \
		--disable-freetypetest \
		--disable-static \
		--with-gtk=2.0 \
		--enable-introspection \
		--disable-gnome-pty-helper

CPE_VENDOR=	nalin_dahyabhai

.include <bsd.mport.options.mk>

.if ${OSVERSION} < 4016
EXTRA_PATCHES+=		${FILESDIR}/extra-patch-gnome-pty-helper_gnome-utmp.c
.endif

.include <bsd.port.mk>

.endif
