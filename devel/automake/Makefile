# $MidnightBSD$

PORTNAME=	automake
PORTVERSION=	1.16.1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator

LICENSE=	gpl3

BUILD_DEPENDS=	autoconf>=2.69:devel/autoconf
RUN_DEPENDS=	autoconf>=2.69:devel/autoconf

BUILD_VERSION=	1.16
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
USES=		cpe makeinfo perl5 tar:xz
GNU_CONFIGURE=	yes
MAKE_ENV+=	MAKEINFOFLAGS=--no-split
INFO=		automake
CPE_VENDOR=	gnu

.include <bsd.port.mk>
