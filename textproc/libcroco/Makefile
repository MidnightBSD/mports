# $MidnightBSD: mports/textproc/libcroco/Makefile,v 1.4 2010/10/19 20:06:45 laffer1 Exp $
#

PORTNAME=	libcroco
PORTVERSION=	0.6.2
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS2 parsing library
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 libxml2 ltverhack
CONFIGURE_ARGS+=	--program-prefix=''

PLIST_SUB=	VERSION="0.6"

.include <bsd.port.mk>
