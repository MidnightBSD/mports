# New ports collection makefile for:	linux-flock
# Date created:		30 March 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/www/linux-flock/Makefile,v 1.17 2007/03/26 22:52:58 sat Exp $
#

PORTNAME=	flock
PORTVERSION=	0.7.12
DISTVERSIONSUFFIX=	.en-US.linux-i686
CATEGORIES=	www
MASTER_SITES=	http://ftp.acc.umu.se/mirror/%SUBDIR%/ \
		http://mirrors.ibiblio.org/pub/mirrors/%SUBDIR%/ \
		http://ftp.osuosl.org/pub/%SUBDIR%/ \
		http://www.gtlib.gatech.edu/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${PORTVERSION:C/(((^|\.)[0-9]+){1,3}).*/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The free web browser that makes it easier to share with your friends

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
