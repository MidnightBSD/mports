PORTNAME=	adamem
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	emulators
MASTER_SITES=	http://www.komkon.org/~dekogel/files/coleco/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable Coleco ADAM and ColecoVision emulator
WWW=		https://www.komkon.org/~dekogel/adamem.html

LICENSE=	ADAMEm
LICENSE_NAME=	ADAMEm Software License
LICENSE_TEXT=	Do not distribute commericially
LICENSE_PERMS=	

RESTRICTED=	yes
NO_CDROM=	yes

NO_WRKSUBDIR=	yes
USE_XORG=	sm x11 xau xext xfixes xi xrandr
MAKE_ARGS=	CC="${CC}" LD="${CC}"
ALL_TARGET=	x

PROGDIR=	${PREFIX}/${PORTNAME}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

post-patch:
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR}," ${WRKSRC}/ADAMEm.c \
		${WRKSRC}/Coleco.c

do-install:
	${MKDIR} ${PROGDIR}
	${INSTALL_PROGRAM} ${WRKSRC}/adamem ${PROGDIR}
	${LN} -s adamem ${PROGDIR}/cvem
	${INSTALL_DATA} ${WRKSRC}/adamem.snd ${PROGDIR}
	${INSTALL_DATA} ${WRKSRC}/OS7.rom ${PROGDIR}
	${INSTALL_DATA} ${WRKSRC}/WP.rom ${PROGDIR}
	${INSTALL_DATA} ${WRKSRC}/EOS.rom ${PROGDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/adamem.txt ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
