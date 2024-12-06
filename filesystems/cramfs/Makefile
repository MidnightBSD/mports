PORTNAME=	cramfs
PORTVERSION=	1.1
CATEGORIES=	filesystems sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux Compressed ROM FileSystem
WWW=		https://sourceforge.net/projects/cramfs/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake

MAKEFILE=	GNUmakefile

PLIST_FILES=	sbin/cramfsck sbin/mkcramfs

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cramfsck ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/mkcramfs ${STAGEDIR}${PREFIX}/sbin

.include <bsd.port.mk>
