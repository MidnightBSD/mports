# $MidnightBSD: mports/audio/gnome-audio/Makefile,v 1.5 2008/09/21 20:00:56 laffer1 Exp $

PORTNAME=	gnome-audio
PORTVERSION=	2.22.2
PORTREVISION=	1
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound files for use with GNOME 2
LICENSE=	agg
# creative commons 2/3 right now

USE_BZIP2=	yes
NO_BUILD=	yes
USE_GNOME=	gnomehier

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share|${PREFIX}/share|' \
		${WRKSRC}/sounds/Makefile

.include <bsd.port.mk>
