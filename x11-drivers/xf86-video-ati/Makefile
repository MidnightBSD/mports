PORTNAME=	xf86-video-ati
PORTVERSION=	19.1.0
PORTREVISION=	5
PORTEPOCH=	1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org ati display driver

PATCH_SITES=	https://gitlab.freedesktop.org/xorg/driver/${PORTNAME}/-/commit/
PATCHFILES+=	f223035f4ffcff2a9296d1e907a5193f8e8845a3.patch:-p1
PATCHFILES+=	4d84cf438e7f1bebf0053035ef0292e9fed257d1.patch:-p1
PATCHFILES+=	c0eb5dbd9c1db6b6d5b1574bcd8c584170d7ab54.patch:-p1
PATCHFILES+=	3845392426e9798c1fb2a6fc5e97bf5dfd5c443d.patch:-p1
PATCHFILES+=	8da3e4561ef82bb78c9a17b8cd8bf139b9cfd680.patch:-p1

EXTRA_PATCHES=	${FILESDIR}/0001_dont_set_sourcevalidate_pointer_to_null.diff:-p1

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

# No Radeon kernel driver on non-x86.
ONLY_FOR_ARCHS=		amd64 i386 powerpc64
ONLY_FOR_ARCHS_REASON=	KMS is required and currently only available on x86

LIB_DEPENDS=	libpciaccess.so:devel/libpciaccess \
		libdrm_radeon.so:graphics/libdrm

USES=		gl xorg xorg-cat:driver
USE_GL=		gl
USE_XORG=	pciaccess

CONFIGURE_ARGS+=--disable-udev

.include <bsd.port.mk>
