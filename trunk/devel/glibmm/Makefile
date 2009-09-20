# $MidnightBSD: mports/devel/glibmm/Makefile,v 1.9 2009/08/26 20:43:15 laffer1 Exp $

PORTNAME=	glibmm
PORTVERSION=	2.20.1
PORTREVISION?=	0
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interfaces for glib2
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	sigc-2.0.0:${PORTSDIR}/devel/libsigc++20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget glib20
USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

post-patch:
.for d in docs examples tests
	@${REINPLACE_CMD} -e '/^SUBDIRS = /s/${d}//' ${WRKSRC}/Makefile.in
.endfor

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/docs/reference/beautify_docs.pl \
		${PREFIX}/lib/glibmm-2.4/proc

.include <bsd.port.mk>

.endif
