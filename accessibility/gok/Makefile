# $MidnightBSD: mports/accessibility/gok/Makefile,v 1.4 2008/06/14 14:39:38 laffer1 Exp $

PORTNAME=	gok
PORTVERSION=	1.3.7
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	accessibility sysutils gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME On-Screen Keyboard (GOK)
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomehack gnomeprefix intlhack libgnomeui atspi libwnck \
		gnomespeech
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gok.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|<malloc.h>|<stdlib.h>|' \
		${WRKSRC}/gok/word-complete.c

.include <bsd.port.mk>
