# $MidnightBSD: mports/devel/libpciaccess/Makefile,v 1.4 2011/05/17 03:30:25 laffer1 Exp $

PORTNAME=	libpciaccess
PORTVERSION=	0.12.1
PORTREVISION=	2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

CONFIGURE_ARGS+=	--with-pciids-path=${LOCALBASE}/share/pciids

XORG_CAT=	lib

.include <bsd.port.mk>
