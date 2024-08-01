PORTNAME=	xkbcomp
DISTVERSION=	1.4.7
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile XKB keyboard description

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USE_XORG=	x11 xkbfile
USES=		pathfix tar:xz xorg xorg-cat:app

PLIST_FILES=	bin/xkbcomp \
		libdata/pkgconfig/xkbcomp.pc \
		share/man/man1/xkbcomp.1.gz

.include <bsd.port.mk>
