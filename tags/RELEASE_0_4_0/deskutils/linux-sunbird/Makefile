# New ports collection makefile for:	linux-sunbird
# Date created:		2004-09-17
# Whom:			voisine
#
# $FreeBSD: ports/deskutils/linux-sunbird/Makefile,v 1.5 2006/08/03 12:41:58 sat Exp $
# $MidnightBSD: mports/deskutils/linux-sunbird/Makefile,v 1.5 2008/06/19 22:48:09 laffer1 Exp $
#

PORTNAME=	sunbird
DISTVERSION=	0.9
DISTVERSIONSUFFIX=	.en-US.linux-i686
CATEGORIES=	deskutils
PORTEPOCH=	1
MASTER_SITE_SUBDIR?=	calendar/${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Calendaring application branched from Mozilla
LICENSE=	mpl

post-extract:
	@${MKDIR} ${WRKSRC}/plugins/
	@${TOUCH} ${WRKSRC}/plugins/.empty
	@${RM} -rf ${WRKSRC}/updates

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
