# Created by: Nikos Ntarmos <ntarmos@ceid.upatras.gr>

PORTNAME=	libconfig
PORTVERSION=	1.7.3
CATEGORIES=	devel
MASTER_SITES=	https://github.com/hyperrealm/${PORTNAME}/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple library for manipulating structured configuration files

LICENSE=	lgpl2.1

USES=		autoreconf libtool pathfix
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFLICTS=	wand-libconfig

OPTIONS_DEFINE=	INFO
OPTIONS_DEFAULT=INFO

INFO_INFO=	libconfig
INFO_CONFIGURE_OFF=	--disable-doc
INFO_USES=	makeinfo

.include <bsd.port.mk>
