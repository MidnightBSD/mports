# $MidnightBSD: mports/devel/glibmm/Makefile,v 1.11 2010/12/04 01:52:36 laffer1 Exp $

PORTNAME=	glibmm
PORTVERSION=	2.24.2
PORTREVISION?=	2
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interfaces for glib2
LICENSE=	lgpl

USE_BZIP2=	yes

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	sigc-2.0.0:${PORTSDIR}/devel/libsigc++20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomehack glib20 ltverhack
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
