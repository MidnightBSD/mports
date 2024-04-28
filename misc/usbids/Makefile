PORTNAME=	usbids
PORTVERSION=	20240130
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known IDs used in USB devices
WWW=		http://www.linux-usb.org/

LICENSE=	bsd3 gpl2 gpl3
LICENSE_COMB=	dual

NO_ARCH=	yes
NO_BUILD=	yes

PORTDATA=	usb.ids

USE_GITHUB=	yes
GH_TAGNAME=	a4cde95

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/usb.ids ${DATADIR}/

.include <bsd.port.mk>
