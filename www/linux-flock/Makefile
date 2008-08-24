# New ports collection makefile for:	linux-flock
# Date created:		30 March 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/linux-flock/Makefile,v 1.4 2008/02/12 16:44:16 laffer1 Exp $
# $FreeBSD: ports/www/linux-flock/Makefile,v 1.17 2007/03/26 22:52:58 sat Exp $
#

PORTNAME=	flock
PORTVERSION=	1.0.8
DISTVERSIONSUFFIX=	.en-US.linux-i686
CATEGORIES=	www
MASTER_SITES=	http://saimei.acc.umu.se/mirror/%SUBDIR%/ \
		http://mirrors.ibiblio.org/pub/mirrors/%SUBDIR%/ \
		http://ftp.osuosl.org/pub/%SUBDIR%/ \
		http://www.gtlib.gatech.edu/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The social web browser
LICENSE=	unknown
# this should be gpl2 or mpl, but they don't post what they are distributing it under.

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
