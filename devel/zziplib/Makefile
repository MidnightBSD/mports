# $MidnightBSD$

PORTNAME=	zziplib
DISTVERSIONPREFIX=	v
DISTVERSION=	0.13.69
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to provide transparent read access to zipped files

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	zip:archivers/zip

USES=		libtool pathfix pkgconfig python:2.7,build shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	gdraheim
GH_PROJECT=	zziplib
USE_LDCONFIG=	yes
SHEBANG_FILES=	docs/*.py

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--srcdir=${WRKSRC}
CONFIGURE_ENV=	ac_cv_path_XMLTO=":"
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
PORTSCOUT=	limit:^0\.

OPTIONS_DEFINE=	SDL
OPTIONS_SUB=	yes
SDL_USE=		SDL=sdl
SDL_CONFIGURE_ENABLE=	sdl

.include <bsd.port.mk>
