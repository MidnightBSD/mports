# $MidnightBSD: mports/graphics/poppler-data/Makefile,v 1.3 2011/06/08 23:19:57 laffer1 Exp $
# $FreeBSD: ports/graphics/poppler-data/Makefile,v 1.1 2006/09/30 04:52:39 ahze Exp $

PORTNAME=	poppler-data
PORTVERSION=	0.4.5
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data
LICENSE=	agg

NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
