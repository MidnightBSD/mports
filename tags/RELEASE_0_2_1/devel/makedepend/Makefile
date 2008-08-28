# New ports collection makefile for:	makedepend
# Date created:				August 15th 1997
# Whom:					Ian Vaudrey <i.vaudrey@bigfoot.com>
#
# $FreeBSD: ports/devel/makedepend/Makefile,v 1.14 2007/07/02 17:00:43 lesi Exp $
# $MidnightBSD: mports/devel/makedepend/Makefile,v 1.1 2007/10/02 19:19:49 ctriv Exp $
#

PORTNAME=	makedepend
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dependency generator for makefiles
LICENSE=	x11

XORG_CAT=	util
USE_XORG=	xproto

BUILD_DEPENDS+=	pkg-config:${PORTSDIR}/devel/pkg-config

PLIST_FILES=	bin/makedepend

MAN1=		makedepend.1

.include <bsd.port.mk>
