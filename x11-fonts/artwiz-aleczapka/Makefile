# Created by: Matt Lancereau <matt@rimasec.net>

PORTNAME=	artwiz-aleczapka-en
PORTVERSION=	1.3
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/artwizaleczapka/iso-8859-1/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of (improved) artwiz fonts

LICENSE=	other

NO_BUILD=	yes
USES=		fonts tar:bzip2

FONTS=		anorexia aqui cure cursor drift edges fkp gelly \
		glisp-bold glisp kates lime mints-mild mints-strong \
		nu smoothansi snap
FILES=		${FONTS:S,$,.pcf,}

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
.for f in ${FILES}
	${INSTALL_DATA} ${WRKSRC}/${f} ${STAGEDIR}${FONTSDIR}
.endfor

.include <bsd.port.mk>
