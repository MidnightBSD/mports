# $MidnightBSD$

PORTNAME=	gnome-audio
PORTVERSION=	2.22.2
PORTREVISION=	3
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound files for use with GNOME 2

LICENSE=	agg
# creative commons 2/3 right now

USES=		tar:bzip2
NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share|${PREFIX}/share|' \
		${WRKSRC}/sounds/Makefile

.include <bsd.port.mk>
