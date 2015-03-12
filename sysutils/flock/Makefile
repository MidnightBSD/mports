# $MidnightBSD$
# $FreeBSD: ports/sysutils/flock/Makefile,v 1.10 2011/08/08 20:02:03 pav Exp $
#

PORTNAME=	flock
PORTVERSION=	2.19
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.zonov.org/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage locks from shell scripts

LICENSE=	mit

PLIST_FILES=	bin/${PORTNAME} \
		man/man1/${PORTNAME}.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
