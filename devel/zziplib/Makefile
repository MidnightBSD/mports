PORTNAME=	zziplib
DISTVERSIONPREFIX=	v
PORTVERSION=	0.13.71
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to provide transparent read access to zipped files

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	gsed:textproc/gsed \
		zip:archivers/zip

USES=		libtool pathfix pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	gdraheim

CONFIGURE_ARGS=	--srcdir=${WRKSRC}
CONFIGURE_ENV=	ac_cv_path_XMLTO=":"
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
USE_LDCONFIG=	yes

PORTSCOUT=	limit:^0\.

OPTIONS_DEFINE=	SDL
OPTIONS_SUB=	yes

SDL_CONFIGURE_ENABLE=	sdl
SDL_USE=		SDL=sdl
SDL_USES=		sdl

.include <bsd.port.mk>
