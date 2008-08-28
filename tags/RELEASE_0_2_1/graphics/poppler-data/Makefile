# New ports collection makefile for:	poppler-data
# Date created:		2006-09-30
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/poppler-data/Makefile,v 1.1 2006/09/30 04:52:39 ahze Exp $
#

PORTNAME=	poppler-data
PORTVERSION=	0.1
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data

NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
