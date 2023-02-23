PORTNAME=	usbids
PORTVERSION=	20230116
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known IDs used in USB devices
WWW=		http://www.linux-usb.org/

LICENSE=	bsd3 gpl2 gpl3
LICENSE_COMB=	dual

NO_ARCH=	yes
NO_BUILD=	yes

PORTDATA=	usb.ids

GH_TAGNAME=	7963233
USE_GITHUB=	yes

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/usb.ids ${DATADIR}/

.include <bsd.port.mk>
