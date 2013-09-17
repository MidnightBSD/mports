# $MidnightBSD$

PORTNAME=	zfs-snapshot-clean
PORTVERSION=	0.1.3
CATEGORIES=	sysutils
MASTER_SITES=	http://cloud.github.com/downloads/knu/${PORTNAME}/ \
		ftp://ftp.iDaemons.org/pub/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to sieve ZFS snapshots as per given spec a la 'pdumpfs-clean'

LICENSE=	bsd2

NO_BUILD=	yes
PLIST_FILES=	sbin/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin/

.include <bsd.port.mk>
