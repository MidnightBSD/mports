# ex:ts=8
# New ports collection makefile for:	libxml++
# Date created:			Feb 26, 2001
# Whom:				Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/libxml++/Makefile,v 1.3 2011/02/02 21:23:47 laffer1 Exp $
# $FreeBSD: ports/textproc/libxml++/Makefile,v 1.36 2007/01/28 09:07:45 kris Exp $
#

PORTNAME=	libxml++
PORTVERSION=	1.0.5
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML API for C++
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack libxml2 pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
