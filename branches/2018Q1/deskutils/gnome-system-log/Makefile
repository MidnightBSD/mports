# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-system-log/Makefile 372768 2014-11-19 11:49:04Z kwm $

PORTNAME=	gnome-system-log
PORTVERSION=	3.9.90
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 system log viewer

LICENSE=	gpl2

BUILD_DEPENDS=	itstool:${PORTSDIR}/textproc/itstool

CONFLICTS=	gnome-utils-2.[0-9]*

USES=		gettext gmake pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix intlhack gtk30
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.gnome-system-log.gschema.xml

.include <bsd.port.mk>
