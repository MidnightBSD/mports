# $MidnightBSD: mports/graphics/yap/Makefile,v 1.3 2009/02/22 23:55:26 laffer1 Exp $

PORTNAME=	yap
PORTVERSION=	0.2
PORTREVISION=	5
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://www.gnustep.it/marko/GPSText/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	Yap
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	repacked/2007-02-15

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep a2ps/gs frontend

LICENSE=	gpl2

RUN_DEPENDS+=	a2ps:${PORTSDIR}/print/a2ps

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GHOSTSCRIPT_RUN=	yes

.include <bsd.port.mk>
