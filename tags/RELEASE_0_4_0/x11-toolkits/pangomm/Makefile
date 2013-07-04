# $MidnightBSD: mports/x11-toolkits/pangomm/Makefile,v 1.4 2011/05/15 19:29:39 laffer1 Exp $

PORTNAME=	pangomm
PORTVERSION=	2.28.2
PORTREVISION?=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Pango
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	glibmm-2.4.1:${PORTSDIR}/devel/glibmm \
		cairomm-1.0.1:${PORTSDIR}/graphics/cairomm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pango
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-documentation \
		--enable-static=yes

PLIST_SUB=	VERSION="2.4" API_VERSION="1.4"

post-patch:
.for d in tests
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/${d}//' \
		${WRKSRC}/Makefile.in
.endfor

.include <bsd.port.mk>

.endif
