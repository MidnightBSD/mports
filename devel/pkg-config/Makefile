# $MidnightBSD: mports/devel/pkg-config/Makefile,v 1.8 2011/07/16 14:53:12 laffer1 Exp $
# $FreeBSD: ports/devel/pkg-config/Makefile,v 1.48 2006/09/11 21:34:02 marcus Exp $

PORTNAME=	pkg-config
PORTVERSION=	0.25
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://pkgconfig.freedesktop.org/releases/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility to retrieve information about installed libraries
LICENSE=	gpl2

USE_CSTD=	gnu89
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

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
