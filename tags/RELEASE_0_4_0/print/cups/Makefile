# $MidnightBSD$
# $FreeBSD: ports/print/cups/Makefile,v 1.54 2011/10/05 06:02:12 dinoex Exp $

PORTNAME=	cups
PORTVERSION=	1.5.0
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System: Metaport to install complete system
LICENSE=	gpl2

BUILD_DEPENDS=	espgs:${PORTSDIR}/${PKGCATEGORY}/cups-pstoraster \
		cupsd:${PORTSDIR}/${PKGCATEGORY}/cups-base
RUN_DEPENDS=	${BUILD_DEPENDS}

NO_BUILD=	yes
NO_INSTALL=	yes

.include <bsd.port.mk>
