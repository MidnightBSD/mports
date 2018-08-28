# $MidnightBSD$

PORTNAME=	gnome-mag
PORTVERSION=	0.16.3
PORTREVISION=	2
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME screen magnifier

LICENSE=	lgpl

USE_XORG=	xfixes xdamage ice xcomposite sm
USE_GNOME=	gnomeprefix atspi libbonobo intlhack
USES=		gmake gettext libtool pathfix pkgconfig tar:bzip2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

DOCSDIR=	${PREFIX}/share/doc/gnome-mag-${PORTVERSION}

.include <bsd.port.mk>
