# New ports collection makefile for:	nvidia-xconfig
# Date created:				10 Dec 2005
# Whom:					Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/x11/nvidia-xconfig/Makefile,v 1.4 2008/03/25 01:47:02 ctriv Exp $
# $FreeBSD: ports/x11/nvidia-xconfig/Makefile,v 1.5 2006/12/06 15:06:13 acm Exp $
#

PORTNAME=	nvidia-xconfig
PORTVERSION=	195.36.15
CATEGORIES=	x11
MASTER_SITES=	ftp://download.nvidia.com/XFree86/nvidia-xconfig/ \
		ftp://download1.nvidia.com/XFree86/nvidia-xconfig/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to manipulate X configuration files for the NVidia driver
LICENSE=	gpl2

USE_GMAKE=	yes

MAKE_ENV=	ROOT=${PREFIX}

WRKSRC=		${WRKDIR}/nvidia-xconfig-1.0

MAN1=		nvidia-xconfig.1
PLIST_FILES=	bin/nvidia-xconfig

.include <bsd.port.mk>
