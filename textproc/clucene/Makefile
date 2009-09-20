# New ports collection makefile for:	clucene
# Date created:		2006-08-09
# Whom:			Cheng-Lung Sung <clsung@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/clucene/Makefile,v 1.1 2008/10/17 17:35:49 laffer1 Exp $
# $FreeBSD: ports/textproc/clucene/Makefile,v 1.8 2008/08/27 02:35:34 clsung Exp $
#

PORTNAME=	clucene
PORTVERSION=	0.9.21
CATEGORIES=	textproc
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	${PORTNAME}-core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLucene is a C++ port of Lucene
LICENSE=	apache2

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22

.include <bsd.port.pre.mk>

.if defined(WITH_ASCII_SUPPORT)
CONFIGURE_ARGS+=	--enable-ascii
.endif

.include <bsd.port.post.mk>
