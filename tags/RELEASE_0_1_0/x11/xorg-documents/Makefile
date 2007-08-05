# New ports collection makefile for:    xorg-documents
# Date created:		23 July 2004
# Whom:			anholt@FreeBSD.org
#
# $MidnightBSD: mports/x11/xorg-documents/Makefile,v 1.1.1.1 2006/09/17 03:33:48 archite Exp $
# $FreeBSD: ports/x11/xorg-documents/Makefile,v 1.7 2006/01/21 18:55:04 lesi Exp $
#

PORTNAME=	xorg-documents
PORTVERSION=	6.9.0
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R${PORTVERSION}/src
DISTFILES=	X11R${PORTVERSION}-src1.tar.gz \
		X11R${PORTVERSION}-src6.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Documentation of X11 protocol and libraries from X.Org

EXTRA_PATCHES=	${CF_PATCHES}

XBUILD_DIRS=	doc/specs

.include "${.CURDIR}/../../x11-servers/xorg-server/Makefile.inc"
.include <bsd.port.pre.mk>

.if ${X_WINDOW_SYSTEM:L} != xorg
IGNORE=	is part of X.Org and you have ${X_WINDOW_SYSTEM} set for X11\
	distribution. See The X Window System and Virtual Consoles chapter\
	of FAQ for more information
.endif

.include <bsd.port.post.mk>
