# $MidnightBSD$

PORTNAME=	ffs2recov
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	http://www.exit.com/Archives/FreeBSD/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to recover UFS2 filesystems

LICENSE=	bsd2

USE_BZIP2=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

MAN8=		ffs2recov.8
PLIST_FILES=	sbin/ffs2recov

MAKE_ENV=	BINDIR=${PREFIX}/sbin MANDIR=${MANPREFIX}/man/man \
		WARNS=0

.include <bsd.port.mk>
