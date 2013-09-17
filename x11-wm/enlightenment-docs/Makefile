# $MidnightBSD$

PORTNAME=	enlightenment-docs
PORTVERSION=	0.16.8.0.2
PORTREVISION=	0
CATEGORIES=	x11-wm
MASTER_SITES=	SF/enlightenment
DISTNAME=	e16-docs-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data files of enlightenment DOX
LICENSE=	mit

RUN_DEPENDS=	${LOCALBASE}/bin/e16:${PORTSDIR}/x11-wm/enlightenment

USE_XORG=	x11
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-fsstd
DATADIR=	${PREFIX}/share/e16

.include <bsd.port.mk>
