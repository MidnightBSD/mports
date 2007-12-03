# New ports collection makefile for:	linux-sunbird
# Date created:		2004-09-17
# Whom:			voisine
#
# $FreeBSD: ports/deskutils/linux-sunbird/Makefile,v 1.5 2006/08/03 12:41:58 sat Exp $
# $MidnightBSD: mports/deskutils/linux-sunbird/Makefile,v 1.2 2007/08/18 08:40:24 laffer1 Exp $
#

PORTNAME=	sunbird
PORTVERSION=	0.7
DISTVERSIONSUFFIX=	.en-US.linux-i686
CATEGORIES=	deskutils
MASTER_SITE_SUBDIR=	calendar/sunbird/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Calendaring application branched from Mozilla

post-extract:
	@${MKDIR} ${WRKSRC}/plugins/
	@${TOUCH} ${WRKSRC}/plugins/.empty
	@${RM} -rf ${WRKSRC}/updates

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
