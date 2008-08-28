# New ports collection makefile for:	enlightenment-docs
# Date created:				08 Aug 2004
# Whom:					vanilla
#
# $MidnightBSD: mports/x11-wm/enlightenment-docs/Makefile,v 1.1 2007/11/10 04:00:39 laffer1 Exp $
# $FreeBSD: ports/x11-wm/enlightenment-docs/Makefile,v 1.4 2007/05/19 20:32:36 flz Exp $
#

PORTNAME=	enlightenment-docs
PORTVERSION=	0.16.8
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	SF
DISTNAME=	e16-docs-${PORTVERSION}-0.02

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data files of enlightenment DOX
LICENSE=	mit

RUN_DEPENDS=	${LOCALBASE}/bin/e16:${PORTSDIR}/x11-wm/enlightenment

USE_XORG=	x11
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-fsstd
DATADIR=	${PREFIX}/share/e16

.include <bsd.port.mk>
