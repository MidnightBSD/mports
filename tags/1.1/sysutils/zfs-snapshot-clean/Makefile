# $MidnightBSD$

PORTNAME=	zfs-snapshot-clean
PORTVERSION=	0.2.0
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to sieve ZFS snapshots as per given spec a la 'pdumpfs-clean'

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	knu

NO_BUILD=	yes
PLIST_FILES=	sbin/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin/

.include <bsd.port.mk>
