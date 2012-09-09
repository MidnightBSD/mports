# $MidnightBSD: mports/accessibility/atk/Makefile,v 1.16 2012/02/29 02:23:58 laffer1 Exp $

PORTNAME=	atk
PORTVERSION=	2.0.1
PORTREVISION?=	1
CATEGORIES=	accessibility devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME accessibility toolkit (ATK)
LICENSE=	lgpl

USE_XZ=		yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack glib20 ltverhack referencehack
CONFIGURE_ARGS=	--enable-static \
		--disable-gtk-doc \
		--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	AUTOCONF=${TRUE} AUTOMAKE=${TRUE}

post-patch:
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/tests//" \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
