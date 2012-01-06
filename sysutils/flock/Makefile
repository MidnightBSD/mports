# $MidnightBSD$
# $FreeBSD: ports/sysutils/flock/Makefile,v 1.10 2011/08/08 20:02:03 pav Exp $
#

PORTNAME=	flock
PORTVERSION=	2.19
CATEGORIES=	sysutils
MASTER_SITES=	http://www.zonov.org/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage locks from shell scripts
LICENSE=	mit

PLIST_FILES=	bin/${PORTNAME}
MAN1=		${PORTNAME}.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MANPREFIX}/man/man1

.include <bsd.port.mk>
