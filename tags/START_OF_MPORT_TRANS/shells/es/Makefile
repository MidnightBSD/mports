# New ports collection makefile for:    es
# Date created:         Sun Aug 13 12:36:14 CDT 1995
# Whom:                 erich@rrnet.com
#
# $MidnightBSD$
# $FreeBSD: ports/shells/es/Makefile,v 1.18 2006/01/10 18:45:31 pav Exp $
#

PORTNAME=	es
PORTVERSION=	0.9.b1
PORTREVISION=	4
CATEGORIES=	shells
MASTER_SITES=	ftp://ftp.sys.toronto.edu/pub/es/
DISTNAME=	es-0.9-beta1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An extensible shell, derived from plan9's rc

GNU_CONFIGURE=	yes
CONFIGURE_ARGS= --with-readline

ALL_TARGET=	es
MAN1=		es.1
PLIST_FILES=	bin/es

.include <bsd.port.mk>
