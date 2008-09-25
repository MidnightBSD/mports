# New ports collection makefile for:	linux-flock
# Date created:		30 March 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/linux-flock/Makefile,v 1.7 2008/09/24 20:47:49 laffer1 Exp $
# $FreeBSD: ports/www/linux-flock/Makefile,v 1.17 2007/03/26 22:52:58 sat Exp $
#

PORTNAME=	flock
PORTVERSION=	1.2.5
DISTVERSIONSUFFIX=	.en-US.linux-i686
CATEGORIES=	www
MASTER_SITES=	\
		http://mirrors.ibiblio.org/pub/mirrors/%SUBDIR%/ \
		http://saimei.acc.umu.se/mirror/%SUBDIR%/ \
		http://ftp.osuosl.org/pub/%SUBDIR%/ \
		http://www.gtlib.gatech.edu/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The social web browser
LICENSE=	gpl2

post-install:
	${BRANDELF} -t Linux ${PREFIX}/lib/linux-flock/flock-bin

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
