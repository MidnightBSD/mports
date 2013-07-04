# New ports collection makefile for:   glib12
# Date Created:			28 July 1998
# Whom:				Vanilla I. Shu <vanilla@FreeBSD.org>
#
# $MidnightBSD: mports/devel/glib12/Makefile,v 1.3 2008/03/26 00:02:59 ctriv Exp $
# $FreeBSD: ports/devel/glib12/Makefile,v 1.61 2006/05/04 21:40:40 edwin Exp $
#

PORTNAME=	glib
PKGNAMESUFFIX=	12
PORTVERSION=	1.2.10
PORTREVISION=	13
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some useful routines of C programming (previous stable version)
LICENSE=	lgpl

USE_CSTD=	gnu89
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--includedir=${PREFIX}/include/glib12

MAN1=		glib-config.1
INFO=		glib

post-install:
	cd ${PREFIX}/bin && ${LN} -sf glib-config glib12-config
.for lib in glib gmodule gthread
	@${RM} ${PREFIX}/lib/lib${lib}.la ${PREFIX}/lib/lib${lib}.so
	@${MV} ${PREFIX}/lib/lib${lib}.a ${PREFIX}/lib/lib${lib}-12.a
.endfor

.include <bsd.port.mk>
