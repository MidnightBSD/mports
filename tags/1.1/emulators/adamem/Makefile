# $MidnightBSD$

PORTNAME=	adamem
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	emulators
MASTER_SITES=	http://www.komkon.org/~dekogel/files/coleco/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ADAMEm is a portable Coleco ADAM and ColecoVision emulator

LICENSE=	ADAMEm
LICENSE_NAME=	ADAMEm Software License
LICENSE_TEXT=	Do not distribute commericially
LICENSE_PERMS=	

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
