# $MidnightBSD$
# $FreeBSD: ports/games/gtkpool/Makefile,v 1.5 2007/05/19 20:06:22 flz Exp $

PORTNAME=	gtkpool
PORTVERSION=	0.5.0
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	ftp://ftp.seul.org/pub/gtkpool/ \
		http://www.sourcefiles.org/Games/Sports/Pool/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	2D pool game using the GTK+ toolkit

LICENSE=	gpl2

USES=		autoreconf gmake perl5 pkgconfig
USE_GNOME=	gtk20
USE_PERL5=	build
GNU_CONFIGURE=	yes
USE_GCC=	any

PORTDATA=	*

post-patch:
.for file in application.cpp options.cpp
	@${REINPLACE_CMD} -e 's|/usr/local/share/gtkpool|${DATADIR}|' \
		${WRKSRC}/gtkpool/${file}
.endfor

.include <bsd.port.mk>
