# $MidnightBSD$

PORTNAME=	gtksourceview
PORTVERSION=	1.8.5
PORTREVISION?=	5
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Widget that adds syntax highlighting to the GtkTextView widget

LICENSE=	gpl2

USES+=		tar:bzip2

.if !defined(REFERENCE_PORT)

USES+=		gettext gmake libtool:keepla pathfix pkgconfig
USE_LDCONFIG=	yes
USE_GNOME=	gnomeprefix libgnome libgnomeprintui intlhack referencehack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-compile-warnings=no
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib -lgnuregex
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>

.endif
