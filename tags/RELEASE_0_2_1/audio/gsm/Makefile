# New ports collection makefile for:	gsm
# Date created:		5 January 1995
# Whom:			pst
#
# $MidnightBSD: mports/audio/gsm/Makefile,v 1.1 2007/04/05 00:13:20 laffer1 Exp $
# $FreeBSD: ports/audio/gsm/Makefile,v 1.22 2006/08/11 20:55:54 sobomax Exp $
#

PORTNAME=	gsm
PORTVERSION=	1.0.12
CATEGORIES=	audio
MASTER_SITES=	http://kbs.cs.tu-berlin.de/~jutta/gsm/ \
		ftp://ftp.dvo.ru/pub/Gentoo/distfiles/ \
		ftp://ftp.gbnet.net/pub/digium/telephony/gnophone/ \
		ftp://216.27.40.102/pub/gnophone/ \
		ftp://ftp.gin.cz/pub/mirrors/ftp.digium.com/pub/telephony/gnophone/ \
		ftp://ftp.ip.pt/.disk1/finkmirrors/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio converter and library for converting u-law to gsm encoding
LICENSE=	other # fairly loose, bsdish.

WRKSRC=		${WRKDIR}/gsm-1.0-pl12

INSTALLS_SHLIB=	yes

MAN1=		toast.1
MAN3=		gsm.3 gsm_explode.3 gsm_option.3 gsm_print.3
MLINKS=		toast.1 untoast.1	toast.1 tcat.1

.include <bsd.port.mk>
