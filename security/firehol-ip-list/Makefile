PORTNAME=	firehol-ip-list
PORTVERSION=	1.0
CATEGORIES=	security
MASTER_SITES=   # none
DISTFILES=      # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Firehol ip list downloader

LICENSE=	bsd2

NO_BUILD=	yes

do-fetch:
	@${DO_NADA}

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/firehol.sh ${PREFIX}/bin

.include <bsd.port.mk>
