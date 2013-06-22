# $MidnightBSD: mports/graphics/poppler-data/Makefile,v 1.4 2012/01/28 01:11:42 laffer1 Exp $

PORTNAME=	poppler-data
PORTVERSION=	0.4.6
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data
LICENSE=	agg

NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
