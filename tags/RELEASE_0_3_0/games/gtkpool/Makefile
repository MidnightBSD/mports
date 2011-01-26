# New ports collection makefile for:	GTKPool
# Date created:				Nov 9 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/games/gtkpool/Makefile,v 1.1 2007/11/10 01:08:44 laffer1 Exp $
# $FreeBSD: ports/games/gtkpool/Makefile,v 1.5 2007/05/19 20:06:22 flz Exp $
#

PORTNAME=	gtkpool
PORTVERSION=	0.5.0
CATEGORIES=	games
MASTER_SITES=	http://gtkpool.seul.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 2D pool game using the GTK+ toolkit
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GNOME=	gtk12
USE_XORG=	x11

post-patch:
	@${REINPLACE_CMD} -e 's,-O2 -O0 -Wall `gtk-config --cflags` -lgtk -lgdk -lglib -lm -lX11,${CXXFLAGS} `gtk-config --cflags` `gtk-config --libs`,' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's,/usr/local/share/gtkpool,${DATADIR},' \
		${WRKSRC}/gtkpool/application.cpp ${WRKSRC}/gtkpool/options.cpp

.include <bsd.port.mk>
