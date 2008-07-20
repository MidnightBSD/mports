# New ports collection makefile for:	plotutils
# Date created:		19 June 1998
# Whom:			Chuck Robey (chuckr)
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/plotutils/Makefile,v 1.35 2007/05/19 20:10:20 flz Exp $
#

PORTNAME=	plotutils
PORTVERSION=	2.5
PORTREVISION=	0
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A plotting library and toolkit

LIB_DEPENDS=	png.5:${PORTSDIR}/graphics/png

USE_GNOME=	gnometarget
USE_MOTIF=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--enable-libplotter --enable-libxmi --with-motif
USE_LDCONFIG=	yes

MAN1=		ode.1 plot.1 plotfont.1 spline.1 tek2plot.1
INFO=		libxmi plotutils

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
