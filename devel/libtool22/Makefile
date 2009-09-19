# $MidnightBSD$

PORTNAME?=	libtool
PORTVERSION=	2.2.6a
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtool
PKGNAMESUFFIX=	22
DISTNAME=	libtool-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic shared library support script
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/libtool-${PORTVERSION:S|a||}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?= --disable-ltdl-install
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
INFO?=		libtool

.include <bsd.port.mk>
