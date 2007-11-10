# New ports collection makefile for:	enlightenment-docs
# Date created:				08 Aug 2004
# Whom:					vanilla
#
# $MidnightBSD$
# $FreeBSD: ports/x11-wm/enlightenment-docs/Makefile,v 1.4 2007/05/19 20:32:36 flz Exp $
#

PORTNAME=	enlightenment-docs
PORTVERSION=	0.16.8
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	enlightenment
DISTNAME=	e16-docs-${PORTVERSION}-0.02

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data files of enlightenment DOX

RUN_DEPENDS=	${X11BASE}/bin/e16:${PORTSDIR}/x11-wm/enlightenment

USE_XLIB=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-fsstd
DATADIR=	${PREFIX}/share/e16

.include <bsd.port.mk>
