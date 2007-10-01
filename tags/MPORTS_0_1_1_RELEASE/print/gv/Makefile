# ex:ts=8
# Ports collection makefile for:  gv
# Date created:			  16 Apr 1996
# Whom:				  tg@freebsd.org
#
# $MidnightBSD: mports/print/gv/Makefile,v 1.1 2007/03/18 17:29:10 laffer1 Exp $
# $FreeBSD: ports/print/gv/Makefile,v 1.49 2006/11/15 21:48:46 miwi Exp $
#

PORTNAME=	gv
PORTVERSION=	3.6.2
PORTREVISION=   1
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PostScript and PDF previewer

LIB_DEPENDS=	Xaw3d:${PORTSDIR}/x11-toolkits/Xaw3d

USE_XLIB=	yes
USE_XPM=	yes
USE_GHOSTSCRIPT=	yes
USE_GETOPT_LONG=	yes
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

post-install:
	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.mk>
