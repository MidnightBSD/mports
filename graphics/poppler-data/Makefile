# $MidnightBSD: mports/graphics/poppler-data/Makefile,v 1.2 2008/10/13 20:48:39 laffer1 Exp $
# $FreeBSD: ports/graphics/poppler-data/Makefile,v 1.1 2006/09/30 04:52:39 ahze Exp $

PORTNAME=	poppler-data
PORTVERSION=	0.4.4
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data
LICENSE=	agg

NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
