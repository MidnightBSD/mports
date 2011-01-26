# New ports collection makefile for:	poppler-data
# Date created:		2006-09-30
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/poppler-data/Makefile,v 1.1 2007/10/21 23:55:29 laffer1 Exp $
# $FreeBSD: ports/graphics/poppler-data/Makefile,v 1.1 2006/09/30 04:52:39 ahze Exp $
#

PORTNAME=	poppler-data
PORTVERSION=	0.1
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data
LICENSE=	agg

NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
