# $MidnightBSD: mports/benchmarks/bonnie/Makefile,v 1.3 2011/04/10 20:18:50 laffer1 Exp $

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
