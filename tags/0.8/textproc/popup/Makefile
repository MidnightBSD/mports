# New ports collection makefile for:    popup
# Date created:         18 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/popup/Makefile,v 1.2 2007/01/31 18:18:09 dinoex Exp $
#

PORTNAME=	popup
PORTVERSION=	0.5
PORTREVISION=	2
CATEGORIES=	textproc gnustep
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/Popup-${PORTVERSION}pre1
DISTNAME=	Popup-${PORTVERSION}pre1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive learning aid for pairs of words

LICENSE=	gpl2 # or later

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/Popup.app/Popup

.include <bsd.port.mk>
