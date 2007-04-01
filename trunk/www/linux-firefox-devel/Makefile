# New ports collection makefile for:	linux-firefox-devel
# Date created:		8 May 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/linux-firefox-devel/Makefile,v 1.6 2006/12/20 20:18:15 laffer1 Exp $
# $FreeBSD: ports/www/linux-firefox-devel/Makefile,v 1.9 2006/08/23 11:08:58 sat Exp $
#

PORTNAME=	firefox
PORTVERSION=	3.0.a${SNAPDATE:S/-/./g}
DISTVERSION=	3.0a4pre
DISTVERSIONSUFFIX=	.en-US.linux-i686
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=   http://ftp.mozilla.org/pub/mozilla.org/%SUBDIR%/ \
		ftp://ftp.mozilla.org/pub/mozilla.org/%SUBDIR%/ \
		http://ftp.belnet.be/packages/mozilla/%SUBDIR%/ \
		ftp://ftp.belnet.be/packages/mozilla/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}/nightly/${SNAPDATE}-04-trunk
PKGNAMESUFFIX=		-devel
DIST_SUBDIR=		${PORTNAME}-${SNAPDATE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla

SNAPDATE=	2007-03-31
USE_BZIP2=	yes

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
