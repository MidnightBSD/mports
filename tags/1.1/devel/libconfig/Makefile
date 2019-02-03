# Created by: Nikos Ntarmos <ntarmos@ceid.upatras.gr>
# $FreeBSD: head/devel/libconfig/Makefile 362605 2014-07-22 23:25:54Z amdmi3 $
# $MidnightBSD$

PORTNAME=	libconfig
PORTVERSION=	1.4.9
CATEGORIES=	devel
MASTER_SITES=	http://www.hyperrealm.com/libconfig/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple library for manipulating structured configuration files

LICENSE=	lgpl2.1

CONFLICTS=	wand-libconfig-[0-9]*

USES=		gmake libtool pathfix
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=	--infodir=${PREFIX}/${INFO_PATH}
INFO=		libconfig

.include <bsd.port.mk>
