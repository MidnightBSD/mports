PORTNAME=	gnome-user-docs
PORTVERSION=	47.6
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME desktop users guide

LICENSE=	CC-BY-3.0
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool

PORTSCOUT=	limit:^47

GNU_CONFIGURE=	yes
NO_ARCH=	yes
USES=		gettext-tools gmake gnome pathfix tar:xz
USE_GNOME=	libxml2:build

.include <bsd.port.mk>
