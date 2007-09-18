# New ports collection makefile for:	Window Manager Improved 2
# Date created:				02 Jun 2005
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD: mports/x11-wm/wmii/Makefile,v 1.7 2007/05/17 10:03:48 wintellect Exp $
# $FreeBSD: ports/x11-wm/wmii/Makefile,v 1.8 2006/06/28 13:17:16 danfe Exp $
#

PORTNAME=	wmii
DISTVERSION=	20070516
CATEGORIES=	x11-wm
MASTER_SITES=	http://www.suckless.org/snaps/
DISTFILES=	wmii+ixp-20070516.tgz
WRKSRC=		${WRKDIR}/wmii+ixp-20070516

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dynamic, minimalist window manager for X11

BUILD_DEPENDS=	dmenu:${PORTSDIR}/x11/dmenu

MAN1=		wmii.1 wmiiloop.1 wmiir.1 wmiiwm.1

.include <bsd.port.mk>
