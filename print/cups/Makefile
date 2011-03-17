# $MidnightBSD: mports/print/cups/Makefile,v 1.6 2010/01/01 23:44:20 laffer1 Exp $
# $FreeBSD: ports/print/cups/Makefile,v 1.29 2006/12/18 14:21:23 dinoex Exp $

PORTNAME=	cups
PORTVERSION=	1.3.11
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System: Metaport to install complete system
LICENSE=	gpl2

BUILD_DEPENDS=	espgs:${PORTSDIR}/print/cups-pstoraster \
		cupsd:${PORTSDIR}/print/cups-base
RUN_DEPENDS=	${BUILD_DEPENDS}

NO_BUILD=	yes
NO_INSTALL=	yes

.include <bsd.port.mk>
