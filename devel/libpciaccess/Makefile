# $MidnightBSD: mports/devel/libpciaccess/Makefile,v 1.5 2011/08/20 13:40:57 laffer1 Exp $

PORTNAME=	libpciaccess
PORTVERSION=	0.13.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

CONFIGURE_ARGS+=	--with-pciids-path=${LOCALBASE}/share/pciids

XORG_CAT=	lib

.include <bsd.port.mk>
