# $MidnightBSD: mports/devel/libpciaccess/Makefile,v 1.1 2009/03/15 18:38:10 laffer1 Exp $

PORTNAME=	libpciaccess
PORTVERSION=	0.10.5
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic PCI access library
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

CONFIGURE_ARGS+=	--with-pciids-path=${LOCALBASE}/share/pciids

XORG_CAT=	lib

.include <bsd.port.mk>
