# $MidnightBSD$
# $FreeBSD: ports/sysutils/screenie/Makefile,v 1.1 2007/03/26 21:20:12 ehaupt Exp $

PORTNAME=	screenie
PORTVERSION=	1.30.0
CATEGORIES=	sysutils
MASTER_SITES=	http://pubwww.fhzh.ch/~mgloor/data/ \
		CRITICAL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small and lightweight screen(1) wrapper

LICENSE=	gpl2

RUN_DEPENDS=	screen:${PORTSDIR}/sysutils/screen

NO_BUILD=	yes

PLIST_FILES=	sbin/screenie man/man1/screenie.1.gz

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
