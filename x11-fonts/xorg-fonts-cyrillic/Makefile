

PORTNAME=	xorg-fonts-cyrillic
PORTVERSION=	7.7
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org Cyrillic bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/cyrillic/crox1c.pcf.gz:${PORTSDIR}/x11-fonts/font-cronyx-cyrillic \
		${FONTDIR}/cyrillic/koi12x24.pcf.gz:${PORTSDIR}/x11-fonts/font-misc-cyrillic \
		${FONTDIR}/cyrillic/screen8x16.pcf.gz:${PORTSDIR}/x11-fonts/font-screen-cyrillic \
		${FONTDIR}/cyrillic/proof9x16.pcf.gz:${PORTSDIR}/x11-fonts/font-winitzki-cyrillic \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

CONFLICTS=	XFree86-fontCyrillic-*

NO_BUILD=	# none
FONTDIR=	${LOCALBASE}/share/fonts

do-install:	# empty

.include <bsd.port.mk>
