# New ports collection makefile for:	screenie
# Date created:				10 August 2004
# Whom:					Emanuel Haupt <ehaupt@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/screenie/Makefile,v 1.1 2007/03/26 21:20:12 ehaupt Exp $
#

PORTNAME=	screenie
PORTVERSION=	1.30.0
CATEGORIES=	sysutils
MASTER_SITES=	http://pubwww.fhzh.ch/~mgloor/data/ \
		CRITICAL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small and lightweight screen(1) wrapper
LICENSE=	gpl2

RUN_DEPENDS=	screen:${PORTSDIR}/sysutils/screen

NO_BUILD=	yes

MAN1=		screenie.1
PLIST_FILES=	sbin/screenie

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MANPREFIX}/man/man1

.include <bsd.port.mk>
