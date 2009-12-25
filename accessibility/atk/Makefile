# $MidnightBSD: mports/accessibility/atk/Makefile,v 1.11 2009/10/18 00:20:32 crash Exp $

PORTNAME=	atk
PORTVERSION=	1.26.0
PORTREVISION=	1
CATEGORIES=	accessibility devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME accessibility toolkit (ATK)
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gnomehack glib20 ltverhack referencehack
CONFIGURE_ARGS=	--enable-static \
		--disable-gtk-doc \
		--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		AUTOCONF=${TRUE} AUTOMAKE=${TRUE}

post-patch:
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/tests//" \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
