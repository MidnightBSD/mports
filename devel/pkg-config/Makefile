# New ports collection makefile for:	pkgconfig
# Date created:				30 April 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/devel/pkg-config/Makefile,v 1.6 2010/02/28 21:18:05 laffer1 Exp $
# $FreeBSD: ports/devel/pkg-config/Makefile,v 1.48 2006/09/11 21:34:02 marcus Exp $
#   $MCom: ports/devel/pkgconfig/Makefile,v 1.6 2005/10/14 20:39:57 adamw Exp $
#

PORTNAME=	pkg-config
PORTVERSION=	0.25
#PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://pkgconfig.freedesktop.org/releases/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility to retrieve information about installed libraries
LICENSE=	gpl2

USE_CSTD=	gnu89
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnometarget

MAN1=		pkg-config.1

.include <bsd.port.pre.mk>

PC_PATH=/usr/libdata/pkgconfig
PC_PATH:=${PC_PATH}:${PREFIX}/libdata/pkgconfig
PC_PATH:=${PC_PATH}:${PREFIX}/lib/pkgconfig
.if ${LOCALBASE} != ${PREFIX}
PC_PATH:=	${PC_PATH}:${LOCALBASE}/libdata/pkgconfig
PC_PATH:=	${PC_PATH}:${LOCALBASE}/lib/pkgconfig
.endif

CONFIGURE_ARGS=	--disable-threads \
		--with-pc-path="${PC_PATH}" \
		--mandir=${PREFIX}/man

.include <bsd.port.post.mk>
