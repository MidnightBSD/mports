# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-screenshot/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-screenshot
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 utility for making picutures of your screen

LICENSE=	gpl2

LIB_DEPENDS=	libcanberra-gtk3.so:${PORTSDIR}/audio/libcanberra-gtk3

USES=		gettext gmake pathfix pkgconfig tar:xz
USE_GNOME=	gtk30 intlhack
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.gnome-screenshot.gschema.xml

.include <bsd.port.mk>
