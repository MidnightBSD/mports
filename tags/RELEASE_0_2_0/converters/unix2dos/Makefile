# New ports collection makefile for:	unix2dos
# Date created:		1 February 1999
# Whom:			obonilla@fisicc-ufm.edu
#
# $FreeBSD: ports/converters/unix2dos/Makefile,v 1.7 2003/02/21 11:08:38 knu Exp $
# $MidnightBSD: mports/converters/unix2dos/Makefile,v 1.1 2006/11/24 22:33:08 laffer1 Exp $
#

PORTNAME=	unix2dos
PORTVERSION=	1.3
CATEGORIES=	converters
MASTER_SITES=	ftp://ftp.guug.org/pub/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Translate ASCII files from DOS (cr/lf) to UNIX (lf)
LICENSE=	unknown

MAN1=		unix2dos.1 dos2unix.1
NO_WRKSUBDIR=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/unix2dos ${PREFIX}/bin/unix2dos
	${LN} -f ${PREFIX}/bin/unix2dos ${PREFIX}/bin/dos2unix
	${INSTALL_MAN} ${WRKDIR}/man1/unix2dos.1 ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKDIR}/man1/dos2unix.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
