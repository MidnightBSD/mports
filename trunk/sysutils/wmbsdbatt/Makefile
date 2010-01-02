# New ports collection Makefile for: 	wmbsdbatt
# Date created:				04 Feb 2004
# Whom:					Josef El-Rayes <josef@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/wmbsdbatt/Makefile,v 1.1 2007/03/11 19:38:08 archite Exp $
# $FreeBSD: ports/sysutils/wmbsdbatt/Makefile,v 1.5 2006/07/27 06:33:44 edwin Exp $

PORTNAME=	wmbsdbatt
PORTVERSION=	0.1
CATEGORIES=	sysutils windowmaker
MASTER_SITES=	http://homepage.univie.ac.at/l.ertl/wmbsdbatt/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockapp for battery & temperature monitoring through ACPI

USE_XORg=	x11 xpm

PLIST_FILES=	bin/wmbsdbatt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmbsdbatt ${PREFIX}/bin

.include <bsd.port.pre.mk>

.include <bsd.port.post.mk>
