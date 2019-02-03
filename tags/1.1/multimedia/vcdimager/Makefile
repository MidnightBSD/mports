# $MidnightBSD$
# $FreeBSD: ports/multimedia/vcdimager/Makefile,v 1.32 2006/06/09 18:59:20 ahze Exp $

PORTNAME=	vcdimager
PORTVERSION=	0.7.24
PORTREVISION=	3
CATEGORIES=	multimedia
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU VCDImager/VCDRip -- The GNU VideoCD Image Maker/Ripping Tool

LICENSE=	gpl2

LIB_DEPENDS=	libpopt.so:${PORTSDIR}/devel/popt \
		libxml2.so:${PORTSDIR}/textproc/libxml2 \
		libcdio.so:${PORTSDIR}/sysutils/libcdio

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--mandir=${PREFIX}/man/ --bindir=${PREFIX}/bin
INSTALL_TARGET=	install-strip
USES=		gmake libtool pkgconfig pathfix
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

INFO=		vcdimager vcdxrip vcd-info

.include <bsd.port.mk>
