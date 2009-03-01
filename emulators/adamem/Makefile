# New ports collection makefile for:   	adamem
# Date created:				November 11, 2001
# Whom:					Jeremy Karlson
#
# $MidnightBSD: mports/emulators/adamem/Makefile,v 1.4 2008/10/21 14:30:52 laffer1 Exp $
# $FreeBSD: ports/emulators/adamem/Makefile,v 1.6 2004/09/23 07:16:23 danfe Exp $
#

PORTNAME=	adamem
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	http://www.komkon.org/~dekogel/files/coleco/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ADAMEm is a portable Coleco ADAM and ColecoVision emulator
LICENSE=	restricted

RESTRICTED=	yes
NO_CDROM=	yes

NO_WRKSUBDIR=	yes
USE_XORG=	sm x11 xau xextproto xext xfixes xi xrandr
ALL_TARGET=	x

PROGDIR=	${PREFIX}/${PORTNAME}

do-install:
	${MKDIR} ${PROGDIR}
	${INSTALL_PROGRAM} ${WRKSRC}/adamem ${PROGDIR}
	${LN} -s adamem ${PROGDIR}/cvem
	${INSTALL_DATA} ${WRKSRC}/adamem.snd ${PROGDIR}
	${INSTALL_DATA} ${WRKSRC}/OS7.rom ${PROGDIR}
	${INSTALL_DATA} ${WRKSRC}/WP.rom ${PROGDIR}
	${INSTALL_DATA} ${WRKSRC}/EOS.rom ${PROGDIR}
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/adamem.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
