# $MidnightBSD$

PORTNAME=	zziplib
PORTVERSION=	0.13.62
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}13/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to provide transparent read access to zipped files

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	zip:${PORTSDIR}/archivers/zip

USES=		tar:bzip2 pathfix pkgconfig gmake libtool python:2,build
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_path_XMLTO=":"
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

PORTSCOUT=	limit:^0\.

OPTIONS_DEFINE=	SDL
OPTIONS_SUB=	yes

SDL_USE=		SDL=sdl
SDL_CONFIGURE_ENABLE=	sdl

regression-test:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${MAKE_ARGS} check)

.include <bsd.port.mk>
