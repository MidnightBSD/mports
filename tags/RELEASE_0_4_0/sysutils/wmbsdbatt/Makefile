# $MidnightBSD: mports/sysutils/wmbsdbatt/Makefile,v 1.4 2010/01/23 22:02:51 laffer1 Exp $
# $FreeBSD: ports/sysutils/wmbsdbatt/Makefile,v 1.5 2006/07/27 06:33:44 edwin Exp $

PORTNAME=	wmbsdbatt
PORTVERSION=	0.1
CATEGORIES=	sysutils windowmaker
MASTER_SITES=	http://homepage.univie.ac.at/l.ertl/wmbsdbatt/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockapp for battery & temperature monitoring through ACPI
LICENSE=	gpl2

USE_XORG=	x11 xpm

PLIST_FILES=	bin/wmbsdbatt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmbsdbatt ${PREFIX}/bin

.include <bsd.port.mk>
