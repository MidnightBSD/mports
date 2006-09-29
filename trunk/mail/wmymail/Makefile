# New ports collection makefile for:	wmymail
# Date created:		27 August 2002
# Whom:			Bruce M Simpson <bms@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/mail/wmymail/Makefile,v 1.7 2005/12/12 21:53:34 bms Exp $

PORTNAME=	wmymail
PORTVERSION=	0.2
PORTREVISION=	2
CATEGORIES=	mail x11
MASTER_SITES=	http://dockapps.org/files/65/96/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Check inbox using a WindowMaker DockApp

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp
RUN_DEPENDS=	fetchmail:${PORTSDIR}/mail/fetchmail

USE_X_PREFIX=	yes

NOMAN=
PLIST_FILES=	bin/wmymail

.include <bsd.port.mk>
