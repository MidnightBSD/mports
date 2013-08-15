# $MidnightBSD$

PORTNAME=	scan_ffs
PORTVERSION=	1.2
CATEGORIES=	sysutils
MASTER_SITES=	http://www.ranner.eu/stuff/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scan_ffs recovers lost disklabel

LICENSE=	bsd2

USE_BZIP2=	yes

MAN8=		scan_ffs.8
PLIST_FILES=	sbin/scan_ffs

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/scan_ffs ${PREFIX}/sbin/.
	${INSTALL_MAN} ${WRKSRC}/scan_ffs.8 ${MAN8PREFIX}/man/man8/.

.include <bsd.port.mk>
