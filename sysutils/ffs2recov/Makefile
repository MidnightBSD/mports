PORTNAME=	ffs2recov
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://BSDforge.com/projects/source/sysutils/ffs2recov/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to recover UFS2 filesystems
WWW=		https://BSDforge.com/projects/sysutils/ffs2recov/

LICENSE=	bsd2

USES=		compiler:c11 tar:bzip2 uidfix
WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	sbin/ffs2recov \
		man/man8/ffs2recov.8.gz

MAKE_ENV=	BINDIR=${PREFIX}/sbin MANDIR=${MANPREFIX}/man/man \
		WARNS=0

.include <bsd.port.mk>
