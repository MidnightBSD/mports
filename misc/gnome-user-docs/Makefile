PORTNAME=	gnome-user-docs
PORTVERSION=	51.0
PORTREVISION=	0
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME desktop users guide
WWW=		https://gitlab.gnome.org/GNOME/gnome-user-docs

LICENSE=	CC-BY-3.0
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext-tools gnome meson tar:xz
USE_GNOME=	libxml2:build
NO_ARCH=	yes

BUILD_DEPENDS=	itstool:textproc/itstool
TEST_DEPENDS=	yelp-check:textproc/yelp-tools

PORTSCOUT=	limit:^51\.

.include <bsd.port.mk>
