PORTNAME=	mate-backgrounds
PORTVERSION=	1.28.0
CATEGORIES=	x11-themes graphics mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of backgrounds for MATE
WWW=		https://mate-desktop.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome pathfix tar:xz
USE_GNOME=	glib20 intlhack
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
