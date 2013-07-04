# $MidnightBSD$

PORTNAME=	rrdtool
PORTVERSION=	1.00
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	http://oss.oetiker.ch/rrdtool/pub/contrib/ \
		http://ftp.ntua.gr/pub/net/monitoring/rrdtool/contrib/ \
		http://www.mirrors.wiretapped.net/security/network-monitoring/rrdtool/contrib/
PKGNAMEPREFIX=	php5-
DISTNAME=	php_rrdtool

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A php 5 rrdtool glue
LICENSE=	php

LIB_DEPENDS=	rrd:${PORTSDIR}/databases/rrdtool

WRKSRC=		${WRKDIR}/rrdtool

USE_PHP=	yes
DEFAULT_PHP_VER=5
USE_PHPEXT=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
BROKEN=		does not configure on 0.2.x
.endif

.include <bsd.port.post.mk>
