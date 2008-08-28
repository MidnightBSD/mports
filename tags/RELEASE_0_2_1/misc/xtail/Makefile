# New ports collection makefile for:   xtail
# Date created:        20 January 1999
# Whom:                gmarco@giovannelli.it
#
# $MidnightBSD$
# $FreeBSD: ports/misc/xtail/Makefile,v 1.10 2006/11/03 22:24:54 ale Exp $
#

PORTNAME=	xtail
PORTVERSION=	2.1
CATEGORIES=	misc
MASTER_SITES=	http://www.unicom.com/sw/xtail/ \
		http://utenti.gufi.org/~gmarco/files/distfiles/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Watches the growth of files or directories

HAS_CONFIGURE=	yes

MAN1=		xtail.1
PLIST_FILES=	bin/xtail

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xtail ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/xtail.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
