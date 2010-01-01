# $MidnightBSD: mports/print/gv/Makefile,v 1.3 2010/01/01 23:53:05 laffer1 Exp $

PORTNAME=	gv
PORTVERSION=	3.6.3
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PostScript and PDF previewer
LICENSE=	gpl2

LIB_DEPENDS=	Xaw3d:${PORTSDIR}/x11-toolkits/Xaw3d

USE_XLIB=	yes
USE_XPM=	yes
USE_GHOSTSCRIPT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--libdir=${PREFIX}/lib/X11 \
		--mandir=${MANPREFIX}/man \
		--infodir=${PREFIX}/${INFO_PATH}

MAN1=		gv.1
INFO=		gv
PLIST_FILES=	bin/gv \
		lib/X11/app-defaults/GV \
		lib/X11/gv/gv_class.ad \
		lib/X11/gv/gv_copyright.dat \
		lib/X11/gv/gv_spartan.dat \
		lib/X11/gv/gv_system.ad \
		lib/X11/gv/gv_user.ad \
		lib/X11/gv/gv_user_res.dat
PLIST_DIRS=	lib/X11/gv

.include <bsd.port.mk>
