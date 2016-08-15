# $MidnightBSD$

PORTNAME=	poppler-data
PORTVERSION=	0.4.7
CATEGORIES=	graphics
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poppler encoding data

LICENSE=	agg

USES=		pathfix
PATHFIX_MAKEFILEIN=Makefile

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
