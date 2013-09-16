# $MidnightBSD$
# $FreeBSD: head/sysutils/zfs-stats/Makefile 326572 2013-09-07 06:13:27Z az $

PORTNAME=	zfs-stats
PORTVERSION=	1.2.2
CATEGORIES=	sysutils
MASTER_SITES=	http://cloud.github.com/downloads/mmatuska/zfs-stats/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display human-readable ZFS statistics

LICENSE=	bsd2

USE_PERL5=	yes

NO_BUILD=	yes

PLIST_FILES=	bin/zfs-stats \
		bin/zfs-mon

post-patch:
	@${REINPLACE_CMD} -e "s|/usr/bin/env -iS perl|${PERL}|g" ${WRKSRC}/zfs-stats

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zfs-stats ${PREFIX}/bin/zfs-stats
	${INSTALL_SCRIPT} ${WRKSRC}/zfs-mon ${PREFIX}/bin/zfs-mon

.include <bsd.port.mk>
