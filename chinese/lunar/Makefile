PORTNAME=	lunar
PORTVERSION=	2.1
PORTREVISION=	2
CATEGORIES=	chinese
MASTER_SITES=	ftp://ftp.cuhk.hk/pub/chinese/ifcss/software/unix/c-utils/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert between Gregorian Solar Calendar (SC) and Lunar Calendar (LC)

ALL_TARGET=

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/chinese
	${INSTALL_PROGRAM} ${WRKSRC}/lunar ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/lunar.bitmap ${STAGEDIR}${PREFIX}/share/chinese
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
