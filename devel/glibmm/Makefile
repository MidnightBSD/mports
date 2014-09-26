# $MidnightBSD$

PORTNAME=	glibmm
PORTVERSION=	2.36.2
PORTREVISION?=	1
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interfaces for glib2

LICENSE=	lgpl

USES+=		tar:xz

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GNOME=	glib20 libsigc++20
USES+=		gettext gmake libtool:keepla pathfix pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-documentation

post-patch:
.for d in docs examples tests
	@${REINPLACE_CMD} -e '/^SUBDIRS = /s/${d}//' ${WRKSRC}/Makefile.in
.endfor

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/lib*.so.*

.include <bsd.port.mk>

.endif
