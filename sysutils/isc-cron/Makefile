PORTNAME=	isc-cron
PORTVERSION=	4.1
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	ISC/cron
DISTNAME=	cron_${PORTVERSION}.shar
EXTRACT_SUFX=	#none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ISC Cron, former Vixie Cron

LICENSE=	iscl

CONFLICTS_INSTALL=	vixie-cron

WRKSRC=		${WRKDIR}
SUB_FILES=	pkg-message
PLIST_FILES=	sbin/cron \
		"@(root,wheel,4755) bin/crontab" \
		man/man1/crontab.1.gz \
		man/man5/crontab.5.gz \
		man/man8/cron.8.gz
PKGMESSAGE=	${WRKDIR}/pkg-message

do-extract:
	${MKDIR} ${WRKSRC}
	cd ${WRKSRC} && ${SH} ${DISTDIR}/${DISTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cron ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/crontab ${PREFIX}/bin
	${CHOWN} root ${PREFIX}/bin/crontab
	${CHMOD} 4555 ${PREFIX}/bin/crontab
	${INSTALL_MAN} ${WRKSRC}/crontab.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/crontab.5 ${PREFIX}/man/man5
	${INSTALL_MAN} ${WRKSRC}/cron.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
