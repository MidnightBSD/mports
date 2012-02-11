# New ports collection makefile for:	sdl_net
# Date created:				20 September 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/net/sdl_net/Makefile,v 1.3 2008/02/27 23:02:02 laffer1 Exp $
# $FreeBSD: ports/net/sdl_net/Makefile,v 1.24 2006/09/20 11:21:56 stas Exp $
#

PORTNAME=	sdl_net
PORTVERSION=	1.2.7
CATEGORIES=	net
MASTER_SITES=	http://www.libsdl.org/projects/SDL_net/release/
DISTNAME=	SDL_net-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small sample cross-platform networking library
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_SDL=	sdl
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=	--disable-gui

post-configure:
	@${REINPLACE_CMD} -e \
		's|^deplibs_check_method=.*|deplibs_check_method=pass_all|' \
			${WRKSRC}/libtool

.include <bsd.port.mk>
