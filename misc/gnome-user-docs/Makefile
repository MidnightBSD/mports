PORTNAME=	gnome-user-docs
PORTVERSION=	50.4
PORTREVISION=	0
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME desktop users guide
WWW=		https://gitlab.gnome.org/GNOME/gnome-user-docs

LICENSE=	CC-BY-3.0
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext-tools gmake gnome pathfix tar:xz
USE_GNOME=	libxml2:build
GNU_CONFIGURE=	yes
NO_ARCH=	yes

BUILD_DEPENDS=	itstool:textproc/itstool

PORTSCOUT=	limit:^50\.

.include <bsd.port.mk>
