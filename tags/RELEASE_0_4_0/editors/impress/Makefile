# Ports collection makefile for:  impress
# Date created:			  23 Aug 2001
# Whom:				  Kris Kennaway <kris@FreeBSD.org>
#
# $MidnightBSD: mports/editors/impress/Makefile,v 1.2 2008/05/15 08:14:29 laffer1 Exp $
# $FreeBSD: ports/editors/impress/Makefile,v 1.9 2007/04/02 22:56:10 pav Exp $
#

PORTNAME=	impress
PORTVERSION=	1.1b9
PORTREVISION=	1
CATEGORIES=	editors tk
MASTER_SITES=	TUCOWS http://fresh.t-systems-sfr.com/unix/src/privat2/ \
		ftp://ftp.plig.net/pub/OpenBSD/distfiles/ \
		ftp://ftp.openoffice.pl/bsd/FreeBSD/ports/distfiles/
DISTNAME=	imp${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Publishing and presentation tool
LICENSE=	gpl2

RUN_DEPENDS=    wish8.4:${PORTSDIR}/x11-toolkits/tk84

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
