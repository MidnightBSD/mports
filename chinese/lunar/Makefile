PORTNAME=	lunar
PORTVERSION=	2.1
PORTREVISION=	2
CATEGORIES=	chinese
MASTER_SITES=	ftp://ftp.cuhk.hk/pub/chinese/ifcss/software/unix/c-utils/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert between Gregorian Solar Calendar (SC) and Lunar Calendar (LC)

ALL_TARGET=

do-install:
	@${MKDIR} ${PREFIX}/share/chinese
	${INSTALL_PROGRAM} ${WRKSRC}/lunar ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/lunar.bitmap ${PREFIX}/share/chinese
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
