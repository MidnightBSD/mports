# Ports collection makefile for:	openhbci
# Date created:				Jan 3, 2003
# Whom:					Heiner Strauss <heiner@bilch.com>
#
# $MidnightBSD: mports/finance/openhbci/Makefile,v 1.1 2008/04/29 03:41:24 laffer1 Exp $
# $FreeBSD: ports/finance/openhbci/Makefile,v 1.14 2007/02/01 02:41:36 kris Exp $

PORTNAME=	openhbci
PORTVERSION=	0.9.17.2
CATEGORIES=	finance
MASTER_SITES= 	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	openhbci-0.9.17-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HBCI is a bank-independent homebanking standard
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
WRKSRC=			${WRKDIR}/${PORTNAME}-0.9.17
GNU_CONFIGURE=		yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

.include <bsd.port.mk>
