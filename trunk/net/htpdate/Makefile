# New ports collection makefile for:	htpdate
# Date created:			9 Jun 2005
# Whom:				Vsevolod Stakhov <vsevolod@highsecure.ru>
#
# $MidnightBSD: mports/net/htpdate/Makefile,v 1.1 2008/05/31 01:07:58 laffer1 Exp $
# $FreeBSD: ports/net/htpdate/Makefile,v 1.14 2007/03/03 16:29:41 miwi Exp $
#

PORTNAME=	htpdate
PORTVERSION=	1.0.4
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.clevervest.com/htp/archive/c/

MAINTAINER=	farrokhi@FreeBSD.org
COMMENT=	Time synchronization over http utility
LICENSE=	gpl2

USE_BZIP2=	yes

MANCOMPRESSED=	no
NOMANCOMPRESS=	yes
MAN8=	htpdate.8.gz

PLIST_FILES=	bin/htpdate

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/htpdate ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/${MAN8} ${MAN8PREFIX}/man/man8

.include <bsd.port.mk>
