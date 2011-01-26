# $MidnightBSD: mports/devel/libtool22/Makefile,v 1.3 2009/12/31 18:07:23 laffer1 Exp $

PORTNAME?=	libtool
PORTVERSION=	2.2.6b
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtool
DISTNAME=	libtool-${PORTVERSION}
EXTRACT_SUFX=	.tar.lzma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic shared library support script
LICENSE=	gpl2

USE_XZ=		yes
WRKSRC=		${WRKDIR}/libtool-${PORTVERSION:S|a||}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?= --disable-ltdl-install
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
INFO?=		libtool

.include <bsd.port.mk>
