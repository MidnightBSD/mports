# $MidnightBSD: mports/x11-toolkits/libbonoboui/Makefile,v 1.9 2012/03/11 18:41:52 laffer1 Exp $

PORTNAME=	libbonoboui
PORTVERSION=	2.24.4
PORTREVISION?=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GUI frontend to the libbonobo component of GNOME 2
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix gnomehack gnomehier intlhack \
		libgnomecanvas libgnome referencehack
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.include <bsd.port.mk>

.endif
