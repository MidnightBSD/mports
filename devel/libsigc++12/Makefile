# $MidnightBSD$

PORTNAME=	libsigc++
PORTVERSION=	1.2.7
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.2
DIST_SUBDIR=	gnome2
PKGNAMESUFFIX=	12

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++

LICENSE=	lgpl

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool
USES=		gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
