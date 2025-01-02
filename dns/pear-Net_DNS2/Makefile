PORTNAME=	Net_DNS2
PORTVERSION=	1.5.4
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	dns net pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP Resolver library used to communicate with a DNS server
WWW=		https://pear.php.net/package/Net_DNS2 \
		https://github.com/mikepultz/netdns2

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		pear

USE_GITHUB=	yes
GH_ACCOUNT=	mikepultz
GH_PROJECT=	netdns2

NO_ARCH=	yes

PLIST_FILES=	${PEARDIR}/Net/DNS2/Names.php \
		${PEARDIR}/Net/DNS2/RR/ZONEMD.php

post-install:
	${MKDIR} ${FAKE_DESTDIR}${PEARDIR}/Net/DNS2 ${FAKE_DESTDIR}${PEARDIR}/Net/DNS2/RR
	${INSTALL_DATA} ${WRKSRC}/Net/DNS2/Names.php ${FAKE_DESTDIR}${PEARDIR}/Net/DNS2/Names.php
	${INSTALL_DATA} ${WRKSRC}/Net/DNS2/RR/ZONEMD.php ${FAKE_DESTDIR}${PEARDIR}/Net/DNS2/RR/ZONEMD.php

.include <bsd.port.mk>
