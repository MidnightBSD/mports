# $MidnightBSD$

PORTNAME=	libbonoboui
PORTVERSION=	2.24.4
PORTREVISION?=	4
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GUI frontend to the libbonobo component of GNOME 2

LICENSE=	gpl2

USES+=		tar:bzip2

.if !defined(REFERENCE_PORT)

USES+=		gettext gmake libtool:keepla pathfix pkgconfig
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix intlhack \
		libgnomecanvas libgnome referencehack
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>

.endif
