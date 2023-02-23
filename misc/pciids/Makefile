PORTNAME=	pciids
PORTVERSION=	20230126
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known IDs used in PCI devices
WWW=		https://pci-ids.ucw.cz/ \
		https://github.com/pciutils/pciids

LICENSE=	bsd3 gpl2 gpl3
LICENSE_COMB=	dual

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	%%DATADIR%%/pci.ids

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}
GH_ACCOUNT=	pciutils
GH_TAGNAME=	3cddb9f
USE_GITHUB=	yes

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/pci.ids ${DATADIR}/

.include <bsd.port.mk>
