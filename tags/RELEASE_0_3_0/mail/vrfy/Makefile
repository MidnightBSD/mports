# ports collection makefile for:	vrfy
# Date created:				2000/09/09
# Whom:					kaz
#
# $MidnightBSD: mports/mail/vrfy/Makefile,v 1.3 2008/05/21 04:43:06 laffer1 Exp $
# $FreeBSD: ports/mail/vrfy/Makefile,v 1.7 2005/10/16 14:24:02 vs Exp $
#

PORTNAME=	vrfy
PORTVERSION=	1.0
CATEGORIES=	mail
MASTER_SITES=	http://jadawin.tuxaco.net/freebsd/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verify mail address
LICENSE=	bsd2

WRKSRC=		${WRKDIR}
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" RES=""
MAN1=		vrfy.1
MANCOMPRESSED=	yes
PLIST_FILES=	bin/vrfy

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/vrfy ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/${MAN1} ${PREFIX}/man/man1/
	${GZIP_CMD} ${PREFIX}/man/man1/${MAN1}

.include <bsd.port.mk>
