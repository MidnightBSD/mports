# New ports collection makefile for:    easydiff
# Date created:         15 Mar 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/easydiff/Makefile,v 1.8 2006/03/19 04:35:47 dinoex Exp $
#

PORTNAME=	easydiff
PORTVERSION=	0.4.0
PORTREVISION=	1
CATEGORIES=	textproc gnustep
MASTER_SITES=	GNUSTEP/usr-apps
DISTNAME=	EasyDiff-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep graphical diff
LICENSE=	gpl3

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/EasyDiff.app/EasyDiff

.include <bsd.port.mk>
