# New ports collection makefile for:	fixrtf
# Date created:		3 Mar 2006
# Whom:			Xin LI <delphij@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/fixrtf/Makefile,v 1.4 2010/05/05 23:53:37 laffer1 Exp $
# $FreeBSD: ports/textproc/fixrtf/Makefile,v 1.1 2006/03/16 07:50:15 delphij Exp $
#
# This port is self contained in the src directory.
#

PORTNAME=	fixrtf
PORTVERSION=	0.1.20060303
PORTREVISION=	4
CATEGORIES=	textproc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A patch making it possible to embed PNGs into RTFs
LICENSE=	bsd2

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

WRKSRC=		${WRKDIR}/src

SRC=		${.CURDIR}/src

do-fetch:
	@${DO_NADA}

pre-patch:
	@${CP} -R ${SRC} ${WRKDIR}

.include <bsd.port.mk>
