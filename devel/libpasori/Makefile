PORTNAME=	libpasori
PORTVERSION=	02
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	OSDN/${PORTNAME}
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FeliCa read/write library for Sony RC-S320 USB FeliCa R/W(PaSoRi)
WWW=		http://libpasori.sourceforge.jp/

USES=		tar:bzip2 uidfix
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

post-extract:
	@${MKDIR} ${WRKSRC}/lib ${WRKSRC}/lpdump ${WRKSRC}/lptest
	@${CP} ${FILESDIR}/Makefile ${WRKSRC}/Makefile
	@${CP} ${FILESDIR}/Makefile.lib.usb20 ${WRKSRC}/lib/Makefile
	@${CP} ${FILESDIR}/Makefile.lpdump ${WRKSRC}/lpdump/Makefile
	@${CP} ${FILESDIR}/Makefile.lptest ${WRKSRC}/lptest/Makefile

.include <bsd.port.mk>
