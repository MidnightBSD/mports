PORTNAME=	mtpfs
PORTVERSION=	1.1
CATEGORIES=	filesystems sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MTP device filesystem
WWW=		https://www.adebenham.com/mtpfs/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libmtp.so:multimedia/libmtp \
		libid3.so:audio/id3lib \
		libid3tag.so:audio/libid3tag \
		libmad.so:audio/libmad

USES=		autoreconf fuse gnome pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	cjd
GH_TAGNAME=	fd3864dd6f0e8183fa2598d4cf890401d3a1e09a
USE_GNOME=	glib20

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/mtpfs

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
