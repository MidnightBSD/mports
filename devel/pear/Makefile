# $MidnightBSD$

PORTNAME=	pear
PORTVERSION=	1.7.2
CATEGORIES=	devel
MASTER_SITES=	http://freebsd.unixfreunde.de/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR framework for PHP
LICENSE=	php

USE_BZIP2=	yes
NO_BUILD=	yes

WANT_PHP_CLI=	yes
USE_PHP_BUILD=	xml
USE_PHP=	xml

FAKE_OPTS+=	prefixhack

PEARDIR=	${PREFIX}/share/pear

post-patch:
	@${MKDIR} ${FAKE_DESTDIR}${PEARDIR}
	@${REINPLACE_CMD} "s|%%PREFIX%%|${FAKE_DESTDIR}${PREFIX}|" ${WRKSRC}/go-pear

do-install:
	${LOCALBASE}/bin/php -q ${WRKSRC}/go-pear
	@${SED} -i "" "s|<?php|<?php dl('pcre.so'); dl('xml.so');|" \
		${PEARDIR}/peclcmd.php

post-install:
	@${SED} -i "" "s|${FAKE_DESTDIR}||" \
		${PREFIX}/bin/pear \
		${PREFIX}/bin/peardev \
		${PREFIX}/bin/pecl \
		${PEARDIR}/pearcmd.php \
		${PEARDIR}/peclcmd.php
	@${RM} ${PREFIX}/etc/pear.conf

.include <bsd.port.mk>
