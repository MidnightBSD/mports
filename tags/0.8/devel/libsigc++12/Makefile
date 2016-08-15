# $MidnightBSD$

PORTNAME=	libsigc++
PORTVERSION=	1.2.7
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.2
PKGNAMESUFFIX=	12
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++

LICENSE=	lgpl

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes

.include <bsd.port.mk>
