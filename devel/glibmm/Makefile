# $MidnightBSD$

PORTNAME=	glibmm
PORTVERSION=	2.36.2
PORTREVISION?=	0
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interfaces for glib2

LICENSE=	lgpl

USES=		tar:xz

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GNOME=	glib20 libsigc++20
USES+=		gettext gmake pkgconfig
USE_PERL5=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static --disable-documentation

post-patch:
.for d in docs examples tests
	@${REINPLACE_CMD} -e '/^SUBDIRS = /s/${d}//' ${WRKSRC}/Makefile.in
.endfor

.include <bsd.port.mk>

.endif
