# $MidnightBSD: mports/net/php5-rrdtool/Makefile,v 1.1 2007/01/26 02:57:58 laffer1 Exp $

PORTNAME=	rrdtool
PORTVERSION=	1.00
CATEGORIES=	net
MASTER_SITES=	http://oss.oetiker.ch/rrdtool/pub/contrib/ \
		http://www.mirrors.wiretapped.net/security/network-monitoring/rrdtool/contrib/
PKGNAMEPREFIX=	php5-
DISTNAME=	php_rrdtool
EXTRACT_SUFX=	.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A php 5 rrdtool glue

LIB_DEPENDS=	rrd:${PORTSDIR}/net/rrdtool

WRKSRC=		${WRKDIR}/rrdtool

USE_PHP=	yes
DEFAULT_PHP_VER=5
USE_PHPEXT=	yes

.include <bsd.port.mk>
