PORTNAME=	gnome-common
PORTVERSION=	3.18.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common automake macros for GNOME 3
WWW=		https://www.gnome.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	autoconf-archive>=0:devel/autoconf-archive
RUN_DEPENDS=	autoconf-archive>=0:devel/autoconf-archive

USES=		gmake pkgconfig tar:xz
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--with-autoconf-archive

.include <bsd.port.mk>
