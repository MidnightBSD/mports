# New ports collection makefile for:	cups
# Date created:		2003-01-22
# Whom:			Alan Eldridge <alane@geeksrus.net>
#
# $MidnightBSD: mports/print/cups/Makefile,v 1.1 2007/01/11 21:11:34 wintellect Exp $
# $FreeBSD: ports/print/cups/Makefile,v 1.29 2006/12/18 14:21:23 dinoex Exp $
#

PORTNAME=	cups
PORTVERSION=	1.2.11
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System: Metaport to install complete system

BUILD_DEPENDS=	espgs:${PORTSDIR}/${PKGCATEGORY}/cups-pstoraster \
		cupsd:${PORTSDIR}/${PKGCATEGORY}/cups-base

NO_BUILD=	yes
NO_INSTALL=	yes

.include <bsd.port.mk>
