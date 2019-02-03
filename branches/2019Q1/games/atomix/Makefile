# $MidnightBSD$

PORTNAME=	atomix
PORTVERSION=	3.22.0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another little mind game

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome localbase pathfix pkgconfig tar:xz
USE_GNOME=	cairo gdkpixbuf2 gtk30 intlhack
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
