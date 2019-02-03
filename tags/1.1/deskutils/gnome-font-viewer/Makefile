# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-font-viewer/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-font-viewer
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 font viewer utility

LICENSE=	gpl2

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig

CONFLICTS=	gnome-utils-2.[0-9]*

USES=		desktop-file-utils gettext gmake pathfix \
		pkgconfig tar:xz
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	intlhack gtk30 gnomedesktop3
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

.include <bsd.port.mk>
