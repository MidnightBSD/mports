# $MidnightBSD: mports/graphics/plotutils/Makefile,v 1.2 2009/04/15 00:46:26 laffer1 Exp $

PORTNAME=	plotutils
PORTVERSION=	2.5.1
PORTREVISION=	0
CATEGORIES=	graphics
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A plotting library and toolkit
LICENSE=	gpl3

LIB_DEPENDS=	png.5:${PORTSDIR}/graphics/png

USE_GNOME=	gnometarget
USE_MOTIF=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--enable-libplotter --enable-libxmi --with-motif
USE_LDCONFIG=	yes

MAN1=		ode.1 plot.1 plotfont.1 spline.1 tek2plot.1
INFO=		libxmi plotutils

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
