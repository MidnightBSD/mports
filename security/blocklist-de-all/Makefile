PORTNAME=	blocklist-de-all
PORTVERSION=	1.0
CATEGORIES=	security
MASTER_SITES=   # none
DISTFILES=      # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Blocklist ip list downloader

LICENSE=	bsd2

NO_BUILD=	yes

do-fetch:
	@${DO_NADA}

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/blocklist.sh ${PREFIX}/bin

.include <bsd.port.mk>
