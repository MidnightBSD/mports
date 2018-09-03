# $MidnightBSD$

PORTNAME=	unix2dos
PORTVERSION=	1.3
PORTREVISION=	2
CATEGORIES=	converters
MASTER_SITES=	FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert ASCII newlines between CR/LF and LF

LICENSE=	unknown

NO_WRKSUBDIR=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unix2dos ${PREFIX}/bin/unix2dos
	${LN} -f ${PREFIX}/bin/unix2dos ${PREFIX}/bin/dos2unix
	${INSTALL_MAN} ${WRKSRC}/man1/unix2dos.1 ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/man1/dos2unix.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
