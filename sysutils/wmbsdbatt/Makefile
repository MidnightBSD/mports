

PORTNAME=	wmbsdbatt
PORTVERSION=	0.1
PORTREVISION=	1
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
