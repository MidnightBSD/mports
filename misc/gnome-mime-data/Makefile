PORTNAME=	gnome-mime-data
PORTVERSION=	2.18.0
PORTREVISION=	5
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DISTNAME=	gnome-mime-data-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIME and Application database for GNOME
WWW=		https://www.gnome.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gmake gnome localbase pathfix tar:bzip2
USE_GNOME=	gnomeprefix intlhack
GNU_CONFIGURE=	yes
LIBS+=		-lintl

.include <bsd.port.mk>
