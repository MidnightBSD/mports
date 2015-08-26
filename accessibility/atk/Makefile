# $MidnightBSD$

PORTNAME=	atk
PORTVERSION=	2.16.0
PORTREVISION?=	2
CATEGORIES=	accessibility devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME accessibility toolkit (ATK)

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USES+=		gettext gmake libtool pathfix pkgconfig
USE_GNOME=	glib20 introspection:build referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
CONFIGURE_ENV=	AUTOCONF=${TRUE} AUTOMAKE=${TRUE}
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s/tests docs//" \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
