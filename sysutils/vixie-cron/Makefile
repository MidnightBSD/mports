PORTNAME=	vixie-cron
PORTVERSION=	4.999
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vixie Cron

LICENSE=	iscl

CONFLICTS_INSTALL=	isc-cron

USE_GITHUB=	yes
GH_PROJECT=	cron
GH_ACCOUNT=	vixie
GH_TAGNAME=	2717db8cedf900c27df61f8c9dcd908d099c2016

WRKSRC=		${WRKDIR}/cron-${GH_TAGNAME}
SUB_FILES=	pkg-message
PLIST_FILES=	sbin/cron \
		"@(root,wheel,4755) bin/crontab" \
		man/man1/crontab.1.gz \
		man/man5/crontab.5.gz \
		man/man8/cron.8.gz
PKGMESSAGE=	${WRKDIR}/pkg-message

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cron ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/crontab ${PREFIX}/bin
	${CHOWN} root ${PREFIX}/bin/crontab
	${CHMOD} 4555 ${PREFIX}/bin/crontab
	${INSTALL_MAN} ${WRKSRC}/crontab.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/crontab.5 ${PREFIX}/man/man5
	${INSTALL_MAN} ${WRKSRC}/cron.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
