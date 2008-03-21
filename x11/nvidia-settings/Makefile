# New ports collection makefile for:	nvidia-settings
# Date created:				15 Aug 2004
# Whom:					Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/x11/nvidia-settings/Makefile,v 1.3 2007/12/06 03:49:37 laffer1 Exp $
# $FreeBSD: ports/x11/nvidia-settings/Makefile,v 1.17 2006/12/06 15:06:13 acm Exp $
#

PORTNAME=	nvidia-settings
PORTVERSION=	1.0
PORTREVISION=	12
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_NVIDIA:S,$,XFree86/${PORTNAME}/,} \
		${MASTER_SITE_LOCAL:S,$,bland/,}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display Control Panel for X NVidia driver
LICENSE=	gpl2

FAKE_OPTS=	prefixhack

USE_GL=		yes
USE_XLIB=	yes
USE_GNOME=	gtk20
USE_GMAKE=	yes

PLIST_FILES=	bin/nvidia-settings
MAN1=		nvidia-settings.1

LDFLAGS+=	${PTHREAD_LIBS}

pre-build:
	cd ${WRKSRC}/src/libXNVCtrl; \
	${CC} -c -I${X11BASE}/include -DCSRG_BASED -DFUNCPROTO=15 -DNARROWPROTO \
		-DXTHREADS -DXUSE_MTSAFE_API -DMALLOC_0_RETURNS_NULL NVCtrl.c; \
	${RM} -f libXNVCtrl.a; \
	ar clq libXNVCtrl.a NVCtrl.o; \
	ranlib libXNVCtrl.a

.include <bsd.port.mk>
