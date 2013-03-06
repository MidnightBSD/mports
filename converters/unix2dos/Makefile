# $MidnightBSD: mports/converters/unix2dos/Makefile,v 1.2 2007/05/25 19:04:15 ctriv Exp $

PORTNAME=	unix2dos
PORTVERSION=	1.3
CATEGORIES=	converters
MASTER_SITES=	CRITICAL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert ASCII files from DOS (cr/lf) to UNIX (lf)
LICENSE=	unknown

MAN1=		unix2dos.1 dos2unix.1
NO_WRKSUBDIR=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/unix2dos ${PREFIX}/bin/unix2dos
	${LN} -f ${PREFIX}/bin/unix2dos ${PREFIX}/bin/dos2unix
	${INSTALL_MAN} ${WRKDIR}/man1/unix2dos.1 ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKDIR}/man1/dos2unix.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
