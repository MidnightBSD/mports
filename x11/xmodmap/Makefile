PORTNAME=	xmodmap
PORTVERSION=	1.0.11
CATEGORIES=	x11
DISTFILES=	xmodmap-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for modifying keymaps and pointer button mappings in X

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg xorg-cat:app tar:xz
USE_XORG=	x11

PLIST_FILES=	bin/xmodmap man/man1/xmodmap.1.gz

.include <bsd.port.mk>
