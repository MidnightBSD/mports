PORTNAME=	libxdg-basedir
DISTVERSIONPREFIX=	v
DISTVERSION=	1.2.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the XDG Base Directory specification

LICENSE=	mit

USES=		autoreconf gmake libtool pathfix
USE_GITHUB=	yes
USE_LDCONFIG=	yes
GH_ACCOUNT=	devnev
GH_TAGNAME=	b978568d1b3ee04e8197f23ca4e3abdd372f85e1
GNU_CONFIGURE=	yes
NO_TEST=	yes

pre-configure:
	@${REINPLACE_CMD} -e 's|"etc"|"${PREFIX}/etc"|' \
		-e '/DefaultConfigDirectories\[\]/,/DefaultRelativeCacheHome\[\]/ s|"/\([^"]\)|"\1|' \
		-e '/DefaultConfigDirectories\[\]/,/DefaultRelativeCacheHome\[\]/ s|/|" DIR_SEPARATOR_STR "|g' \
		${WRKSRC}/src/basedir.c

.include <bsd.port.mk>
