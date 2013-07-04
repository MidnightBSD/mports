# $MidnightBSD: mports/x11-toolkits/libsexy/Makefile,v 1.7 2013/02/22 03:11:01 laffer1 Exp $

PORTNAME=	libsexy
PORTVERSION=	0.1.11
PORTREVISION=	2
CATEGORIES=	x11-toolkits devel
MASTER_SITES=	http://releases.chipx86.com/libsexy/libsexy/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension widgets for GTK+
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	enchant:${PORTSDIR}/textproc/enchant
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_AUTOTOOLS=	libtool
USE_GETTEXT=	yes
USE_GNOME=	gnomehack lthack gtk20 libxml2
USE_LDCONFIG=	yes
USE_PKGCONFIG=	build
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
