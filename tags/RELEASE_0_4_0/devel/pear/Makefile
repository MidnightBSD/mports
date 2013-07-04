# $MidnightBSD: mports/devel/pear/Makefile,v 1.5 2009/04/17 16:44:42 laffer1 Exp $

PORTNAME=	pear
PORTVERSION=	1.7.2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://cvsup13.tw.freebsd.org/pub/FreeBSD/distfiles/

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
	${SED} -i "" "s|${FAKE_DESTDIR}||g" \
		${PREFIX}/bin/pear \
		${PREFIX}/bin/peardev \
		${PREFIX}/bin/pecl \
		${PEARDIR}/pearcmd.php \
		${PEARDIR}/peclcmd.php \
		${PEARDIR}/.registry/archive_tar.reg \
		${PEARDIR}/.registry/console_getopt.reg \
		${PEARDIR}/.registry/pear.reg \
		${PEARDIR}/.registry/structures_graph.reg
	@${RM} ${PREFIX}/etc/pear.conf

.include <bsd.port.mk>
