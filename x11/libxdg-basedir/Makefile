# $MidnightBSD: mports/x11/libxdg-basedir/Makefile,v 1.2 2011/05/07 00:29:29 laffer1 Exp $

PORTNAME=	libxdg-basedir
PORTVERSION=	1.1.1
CATEGORIES=	x11
MASTER_SITES=	http://n.ethz.ch/student/nevillm/download/libxdg-basedir/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the XDG Base Directory specification
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
