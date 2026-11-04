PORTNAME=	unclutter
PORTVERSION=	8
PORTREVISION=	4
CATEGORIES=	misc
MASTER_SITES=	XCONTRIB/utilities

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Remove idle cursor image from screen

LICENSE=        publicdom

WRKSRC=		$(WRKDIR)/unclutter
USES=		imake tar:Z xorg
USE_XORG=	x11 xext
PLIST_FILES=	bin/unclutter \
		share/man/man1/unclutter.1.gz

post-install:
	${MKDIR} ${PREFIX}/share/man/man1/
	-${MV} ${PREFIX}/man/man1/unclutter.1.gz ${PREFIX}/share/man/man1/

.include <bsd.port.mk>
