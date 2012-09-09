# $MidnightBSD: mports/graphics/plotutils/Makefile,v 1.7 2011/12/15 00:57:47 laffer1 Exp $

PORTNAME=	plotutils
PORTVERSION=	2.6
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A plotting library and toolkit
LICENSE=	gpl3

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

USE_GNOME=	
USE_MOTIF=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--enable-libplotter --enable-libxmi --with-motif
USE_LDCONFIG=	yes

MAN1=		ode.1 plot.1 plotfont.1 spline.1 tek2plot.1
INFO=		libxmi plotutils

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
