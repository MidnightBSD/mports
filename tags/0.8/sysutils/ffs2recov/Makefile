# $MidnightBSD$

PORTNAME=	ffs2recov
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	http://www.exit.com/Archives/FreeBSD/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to recover UFS2 filesystems

LICENSE=	bsd2

USES=		tar:bzip2
WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	sbin/ffs2recov \
		man/man8/ffs2recov.8.gz

MAKE_ENV=	BINDIR=${PREFIX}/sbin MANDIR=${MANPREFIX}/man/man \
		WARNS=0

.include <bsd.port.mk>
