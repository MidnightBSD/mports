# $MidnightBSD$
# $FreeBSD: ports/print/cups/Makefile,v 1.54 2011/10/05 06:02:12 dinoex Exp $

PORTNAME=	cups
PORTVERSION=	2.0.3
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System: Metaport to install complete system

LICENSE=	gpl2

RUN_DEPENDS=	espgs:${PORTSDIR}/${PKGCATEGORY}/cups-pstoraster \
		cupsd:${PORTSDIR}/${PKGCATEGORY}/cups-base \
		ttfread:${PORTSDIR}/${PKGCATEGORY}/cups-filters

NO_BUILD=	yes
NO_INSTALL=	yes

SUB_FILES=	pkg-message

.include <bsd.port.mk>
