PORTNAME=	usbids
PORTVERSION=	20210719
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known IDs used in USB devices

LICENSE=	bsd3 gpl2 gpl3
LICENSE_COMB=	dual

NO_ARCH=	yes
NO_BUILD=	yes

PORTDATA=	usb.ids

GH_TAGNAME=	0e7a9f9
USE_GITHUB=	yes

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/usb.ids ${STAGEDIR}${DATADIR}/

.include <bsd.port.mk>
