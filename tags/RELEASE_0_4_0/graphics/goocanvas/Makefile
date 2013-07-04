# $MidnightBSD$
# $FreeBSD: ports/graphics/goocanvas/Makefile,v 1.14 2010/12/04 07:31:58 ade Exp $

PORTNAME=	goocanvas
PORTVERSION=	0.15
CATEGORIES=	graphics
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Canvas widget for GTK+
LICENSE=	lgpl

USE_GNOME=	gtk20 gnomehack ltverhack
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_BZIP2=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${datadir}/gtk-doc/html|${DOCSDIR}|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
