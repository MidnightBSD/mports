# New ports collection makefile for:	nvidia-xconfig
# Date created:				10 Dec 2005
# Whom:					Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/x11/nvidia-xconfig/Makefile,v 1.3 2008/03/21 23:30:51 laffer1 Exp $
# $FreeBSD: ports/x11/nvidia-xconfig/Makefile,v 1.5 2006/12/06 15:06:13 acm Exp $
#

PORTNAME=	nvidia-xconfig
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_NVIDIA:S,$,XFree86/${PORTNAME}/,} \
		${MASTER_SITE_LOCAL:S,$,bland/,}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to manipulate X configuration files for the NVidia driver
LICENSE=	gpl2

USE_GMAKE=	yes

MAKE_ENV=	ROOT=${PREFIX} \
		CC=${CC}

MAN1=		nvidia-xconfig.1
PLIST_FILES=	bin/nvidia-xconfig

.include <bsd.port.mk>
