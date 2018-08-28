# $MidnightBSD$

PORTNAME=	zfs-replicate
PORTVERSION=	0.7
CATEGORIES=	sysutils
MASTER_SITES=	http://blogs.sun.com/constantin/resource/
DISTNAME=	${PORTNAME}_v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS Snapshot Replication Script

LICENSE=	cddl

NO_WRKSUBDIR=	yes
NO_BUILD=	yes
USES=		tar:bzip2

PLIST_FILES=	sbin/zfs-replicate

do-patch:
	@${REINPLACE_CMD} -e 's|/usr/sbin/zfs|/sbin/zfs|g' ${WRKSRC}/zfs-replicate_v${PORTVERSION}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zfs-replicate_v${PORTVERSION} ${PREFIX}/sbin/zfs-replicate

.include <bsd.port.mk>
