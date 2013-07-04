# $MidnightBSD: mports/devel/libsigc++12/Makefile,v 1.4 2011/12/15 00:34:44 laffer1 Exp $

PORTNAME=	libsigc++
PORTVERSION=	1.2.7
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.2
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++
LICENSE=	lgpl

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
LATEST_LINK=	libsigc++12
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
