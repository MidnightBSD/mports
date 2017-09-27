# $MidnightBSD$

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
PLIST_FILES=	bin/bonnie man/man1/bonnie.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/Bonnie ${TARGETDIR}/bin/bonnie
	${INSTALL_MAN} ${FILESDIR}/bonnie.1 ${TARGETDIR}/man/man1

.include <bsd.port.mk>
