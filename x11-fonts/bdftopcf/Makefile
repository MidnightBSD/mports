PORTNAME=	bdftopcf
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert X font from BDF to PCF
WWW=          https://www.x.org/archive/X11R6.8.1/doc/bdftopcf.1.html

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		localbase xorg xorg-cat:app
USE_XORG=	xorgproto

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

PLIST_FILES=	bin/bdftopcf share/man/man1/bdftopcf.1.gz

.include <bsd.port.mk>
