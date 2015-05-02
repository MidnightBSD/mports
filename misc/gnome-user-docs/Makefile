# $MidnightBSD$

PORTNAME=	gnome-user-docs
PORTVERSION=	3.14.2
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 users guide

LICENSE=	other

BUILD_DEPENDS=	itstool:${PORTSDIR}/textproc/itstool

GNU_CONFIGURE=	yes
USES=		gettext-tools gmake pathfix tar:xz
USE_GNOME=	gnomeprefix libxml2:build

.include <bsd.port.mk>
