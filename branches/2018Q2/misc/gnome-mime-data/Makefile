# $MidnightBSD$
# $FreeBSD: ports/misc/gnome-mime-data/Makefile,v 1.37 2007/04/03 20:38:53 marcus Exp $
#

PORTNAME=	gnome-mime-data
PORTVERSION=	2.18.0
PORTREVISION=	4
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DISTNAME=	gnome-mime-data-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIME and Application database for GNOME

LICENSE=	gpl2

USES=		gettext gmake pathfix tar:bzip2
USE_GNOME=	gnomeprefix intlhack
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib -lintl

.include <bsd.port.mk>
