# $MidnightBSD: mports/lang/nawk/Makefile,v 1.5 2010/12/11 18:46:56 laffer1 Exp $
# $FreeBSD: ports/lang/nawk/Makefile,v 1.33 2005/12/01 11:21:05 flz Exp $

PORTNAME=	nawk
PORTVERSION=	20110506
CATEGORIES=	lang
MASTER_SITES=	http://www.cs.princeton.edu/~bwk/btl.mirror/
DISTNAME=	awk
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Brian Kernighan's pattern scanning and processing language
LICENSE=	mit

NO_WRKSUBDIR=	yes
MAKEFILE=	makefile
ALL_TARGET=	a.out
MAN1=		nawk.1
CFLAGS+=	-DHAS_ISBLANK
PLIST_FILES=	bin/nawk

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/a.out ${PREFIX}/bin/nawk
	${SED} -e 's|awk|nawk|g' ${WRKSRC}/awk.1 > ${WRKSRC}/nawk.1
	${INSTALL_MAN} ${WRKSRC}/nawk.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
