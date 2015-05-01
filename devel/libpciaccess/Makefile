# $MidnightBSD$

PORTNAME=	libpciaccess
PORTVERSION=	0.13.2
PORTREVISION=	2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library

LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

CONFIGURE_ARGS+=	--with-pciids-path=${LOCALBASE}/share/pciids

XORG_CAT=	lib

.include <bsd.port.mk>
