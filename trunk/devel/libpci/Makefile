# $MidnightBSD: mports/devel/libpci/Makefile,v 1.1 2010/03/13 02:59:29 laffer1 Exp $

PORTNAME=	libpci
PORTVERSION=	3.1.7
CATEGORIES=	devel
MASTER_SITES=	ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci/ \
		${MASTER_SITE_KERNEL_ORG} \
		ftp://metalab.unc.edu/pub/Linux/hardware/
MASTER_SITE_SUBDIR=	software/utils/pciutils
DISTNAME=	pciutils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PCI configuration space I/O made easy
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

USE_GMAKE=	yes
NO_INSTALL_MANPAGES=	yes
USE_LDCONFIG=	yes
MAKE_ENV=	LANG=C
ALL_TARGET=	lib/libpci.a

do-install:
	@(${INSTALL_DATA} ${WRKSRC}/lib/libpci.so ${PREFIX}/lib/libpci.so.3)
	@(${INSTALL_DATA} ${WRKSRC}/lib/libpci.a ${PREFIX}/lib/libpci.a)
	@(${LN} -sf ${PREFIX}/lib/libpci.so.3 ${PREFIX}/lib/libpci.so)
	@(${MKDIR} ${PREFIX}/include/pci)
	@(${INSTALL_DATA} ${WRKSRC}/lib/config.h ${PREFIX}/include/pci/config.h)
	@(${INSTALL_DATA} ${WRKSRC}/lib/header.h ${PREFIX}/include/pci/header.h)
	@(${INSTALL_DATA} ${WRKSRC}/lib/pci.h ${PREFIX}/include/pci/pci.h)
	@(${INSTALL_DATA} ${WRKSRC}/lib/types.h ${PREFIX}/include/pci/types.h)

.include <bsd.port.mk>
