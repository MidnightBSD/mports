PORTNAME=	exfat
DISTVERSIONPREFIX=	v
DISTVERSION=	1.4.0
PORTREVISION=	1
CATEGORIES=	filesystems
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-featured exFAT FS implementation as a FUSE module
WWW=		https://github.com/relan/exfat

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libublio.so:devel/libublio

USES=		autoreconf cpe fuse localbase pkgconfig
CPE_VENDOR=	${PORTNAME}_project
USE_GITHUB=	yes
GH_ACCOUNT=	relan
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

MAKE_ARGS=	SUBDIRS="libexfat fuse"

PLIST_FILES=	sbin/mount.exfat-fuse sbin/mount.exfat share/man/man8/mount.exfat-fuse.8.gz

.include <bsd.port.mk>
