# Created by: Ivan Dreckman <ivannashdreckman@fastmail.fm>

PORTNAME=	zxfer
PORTVERSION=	1.1.7
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easily and reliably transfer ZFS filesystems

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	allanjude

NO_BUILD=	yes

OPTIONS_DEFINE=	RSYNC

RSYNC_DESC=		Enable RSYNC Support
RSYNC_RUN_DEPENDS=	rsync:net/rsync

.include <bsd.mport.options.mk>

PLIST_FILES=	man/man8/zxfer.8.gz \
		sbin/zxfer

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zxfer ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/zxfer.8 ${STAGEDIR}${MAN8PREFIX}/man/man8

.include <bsd.port.mk>
