PORTNAME=	pciids
PORTVERSION=	20250127
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known IDs used in PCI devices
WWW=		https://pci-ids.ucw.cz/ \
		https://github.com/pciutils/pciids

LICENSE=	bsd3 gpl2+
LICENSE_COMB=	dual

NO_ARCH=	yes
NO_BUILD=	yes

PORTDATA=	pci.ids

USE_GITHUB=	yes
GH_ACCOUNT=	pciutils
GH_TAGNAME=	d0d2fef

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/pci.ids ${DATADIR}/

.include <bsd.port.mk>
