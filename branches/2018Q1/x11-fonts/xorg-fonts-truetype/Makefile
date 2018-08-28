# $MidnightBSD$

PORTNAME=	xorg-fonts-truetype
PORTVERSION=	7.7
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org TrueType fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/TTF/luximb.ttf:${PORTSDIR}/x11-fonts/font-bh-ttf \
		${FONTDIR}/OTF/SyrCOMAdiabene.otf:${PORTSDIR}/x11-fonts/font-misc-meltho \
		${FONTDIR}/TTF/GohaTibebZemen.ttf:${PORTSDIR}/x11-fonts/font-misc-ethiopic \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings \
		${FONTDIR}/dejavu/DejaVuSans.ttf:${PORTSDIR}/x11-fonts/dejavu

NO_BUILD=	# none

NO_MTREE=	yes
FONTDIR=	${LOCALBASE}/share/fonts

do-install:
	@${NADA}

.include <bsd.port.mk>
