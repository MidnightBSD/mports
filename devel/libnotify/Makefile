# $MidnightBSD: mports/devel/libnotify/Makefile,v 1.7 2012/12/20 04:19:36 laffer1 Exp $

PORTNAME=	libnotify
PORTVERSION=	0.7.3
PORTREVISION=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for desktop notifications
LICENSE=	lgpl2.1

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

USE_BZIP2=	yes
USE_GNOME=	gnomehack intlhack glib20 gtk20 ltverhack
USES=		gettext
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
