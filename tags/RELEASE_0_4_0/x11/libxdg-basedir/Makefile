# $MidnightBSD: mports/x11/libxdg-basedir/Makefile,v 1.3 2012/03/03 01:52:53 laffer1 Exp $

PORTNAME=	libxdg-basedir
PORTVERSION=	1.2.0
CATEGORIES=	x11
MASTER_SITES=	http://nevill.ch/libxdg-basedir/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the XDG Base Directory specification
LICENSE=	mit

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

pre-configure:
	@${REINPLACE_CMD} -e \
		's|$$(libdir)/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|"etc"|"${PREFIX}/etc"|' \
		-e '/DefaultConfigDirectories\[\]/,/DefaultRelativeCacheHome\[\]/ s|"/\([^"]\)|"\1|' \
		-e '/DefaultConfigDirectories\[\]/,/DefaultRelativeCacheHome\[\]/ s|/|" DIR_SEPARATOR_STR "|g' \
		${WRKSRC}/src/basedir.c

.include <bsd.port.mk>
