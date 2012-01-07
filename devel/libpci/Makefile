# $MidnightBSD: mports/devel/libpci/Makefile,v 1.2 2011/07/16 15:03:58 laffer1 Exp $

PORTNAME=	libpci
PORTVERSION=	3.1.8
CATEGORIES=	devel
MASTER_SITES=	ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci/ \
		FREEBSD_LOCAL/sunpoet
DISTNAME=	pciutils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PCI configuration space I/O made easy
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

ALL_TARGET=	lib/libpci.a
MAKE_ENV=	LANG=C
USE_GMAKE=	yes
USE_LDCONFIG=	yes

LIBPCI_FILES=	include/pci/config.h include/pci/header.h include/pci/pci.h \
		include/pci/types.h lib/libpci.a lib/libpci.so \
		libdata/pkgconfig/libpci.pc

post-patch:
	@${REINPLACE_CMD} 's|^CC=|CC?=|; s|%%PREFIX%%|${PREFIX}|' ${WRKSRC}/Makefile

post-build:
	@${REINPLACE_CMD} 's|^#include "|&pci/|' ${WRKSRC}/lib/pci.h

do-install:
	@${MKDIR} ${PREFIX}/include/pci/
.for file in ${LIBPCI_FILES}
	@${INSTALL_DATA} ${WRKSRC}/lib/${file:T} ${PREFIX}/${file}
.endfor
	@${LN} -fs libpci.so ${PREFIX}/lib/libpci.so.3

.include <bsd.port.mk>
