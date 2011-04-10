# $MidnightBSD: mports/benchmarks/bonnie/Makefile,v 1.2 2008/06/25 15:14:23 laffer1 Exp $
# $FreeBSD: ports/benchmarks/bonnie/Makefile,v 1.15 2006/08/12 15:16:45 se Exp $

PORTNAME=	bonnie
PORTVERSION=	2.0.6
PORTREVISION=	1
CATEGORIES=	benchmarks
MASTER_SITES=	http://www.acnc.com/benchmarks/ \
		http://www.textuality.com/bonnie/
DISTNAME=	bonnie

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Filesystem I/O
LICENSE=	other

NO_WRKSUBDIR=	yes
#CFLAGS+=	-static
MAKE_ARGS+=	-e CFLAGS="${CFLAGS}"
ALL_TARGET=	bsd
MAN1=		bonnie.1
PLIST_FILES=	bin/bonnie

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/Bonnie ${TARGETDIR}/bin/bonnie
	${INSTALL_MAN} ${FILESDIR}/bonnie.1 ${TARGETDIR}/man/man1

.include <bsd.port.mk>
