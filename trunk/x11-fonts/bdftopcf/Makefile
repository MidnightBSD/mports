# $MidnightBSD$

PORTNAME=	bdftopcf
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert X font from BDF to PCF

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

XORG_CAT=	app
USES=		localbase
USE_XORG=	xorgproto

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

PLIST_FILES=	bin/bdftopcf man/man1/bdftopcf.1.gz

.include <bsd.port.mk>
