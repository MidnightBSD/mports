PORTNAME=	wimlib
PORTVERSION=	1.13.0
CATEGORIES=	filesystems sysutils
MASTER_SITES=	https://wimlib.net/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate Windows Imaging (WIM) archives
WWW=		https://wimlib.net/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING.GPLv3

USES=		gmake gnome fuse libtool pkgconfig
USE_GNOME=	libxml2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--disable-static

OPTIONS_DEFINE=		NTFS
OPTIONS_DEFAULT=	NTFS

NTFS_DESC=	Build with libntfs-3g for NTFS support (recommended)

NTFS_CONFIGURE_WITH=	ntfs-3g
NTFS_LIB_DEPENDS=	libntfs-3g.so:filesystems/ntfs

.include <bsd.port.mk>
