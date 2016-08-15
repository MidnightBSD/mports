# $MidnightBSD$

PORTNAME=	scan_ffs
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.ranner.eu/stuff/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scan_ffs recovers lost disklabel

LICENSE=	bsd2

USES=		tar:bzip2

PLIST_FILES=	sbin/scan_ffs man/man8/scan_ffs.8.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/scan_ffs ${PREFIX}/sbin/.
	${INSTALL_MAN} ${WRKSRC}/scan_ffs.8 ${MAN8PREFIX}/man/man8/.

.include <bsd.port.mk>
