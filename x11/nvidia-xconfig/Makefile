# New ports collection makefile for:	nvidia-xconfig
# Date created:				10 Dec 2005
# Whom:					Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/nvidia-xconfig/Makefile,v 1.4 2006/01/16 13:34:16 bland Exp $
#

PORTNAME=	nvidia-xconfig
PORTVERSION=	1.0
CATEGORIES=	x11
MASTER_SITES=	http://download.nvidia.com/XFree86/nvidia-xconfig/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	bland

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to manipulate X configuration files for the NVidia driver

USE_GMAKE=	yes

MAKE_ENV=	ROOT=${PREFIX} \
		CC=${CC}

MAN1=		nvidia-xconfig.1
PLIST_FILES=	bin/nvidia-xconfig

.include <bsd.port.mk>
