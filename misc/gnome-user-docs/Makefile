PORTNAME=	gnome-user-docs
PORTVERSION=	42.0
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME desktop users guide

LICENSE=	CC-BY-3.0
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool

PORTSCOUT=	limitw:1,even

GNU_CONFIGURE=	yes
NO_ARCH=	yes
USES=		gettext-tools gmake gnome pathfix tar:xz
USE_GNOME=	libxml2:build

.include <bsd.port.mk>
