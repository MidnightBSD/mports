# $MidnightBSD$

PORTNAME=	xorg-vfbserver
PORTVERSION=	1.14.7
CATEGORIES=	x11-servers
MASTER_SITES=	XORG/individual/xserver
DISTNAME=	xorg-server-${PORTVERSION}
DIST_SUBDIR=	xorg/xserver

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X virtual framebuffer server from X.Org

LICENSE=	mit

USES=		tar:bzip2 pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dmx \
		--disable-xephyr \
		--disable-xnest \
		--disable-kdrive \
		--disable-xfbdev \
		--disable-xfake \
		--disable-screensaver \
		--disable-xwin \
		--disable-xwayland \
		--disable-xorg \
		--without-xmlto \
		--disable-docs \
		--disable-devel-docs \
		--localstatedir=/var \
		--without-dtrace \
		--without-doxygen \
		--disable-libpciaccess \
		--disable-glx \
		--disable-dri  \
		--disable-config-hal \
		--disable-libdrm \
		--disable-glx-tls \
		--disable-vbe \
		--disable-vgahw \
		--enable-xvfb \
		--with-fontrootdir=${PREFIX}/share/fonts

USE_XORG=	pixman x11 fixesproto damageproto xcmiscproto xtrans \
		bigreqsproto randrproto renderproto xextproto inputproto \
		videoproto compositeproto recordproto \
		fontsproto resourceproto xf86driproto glproto \
		presentproto xineramaproto xkbfile xfont

PLIST_FILES=	bin/Xvfb \
		man/man1/Xvfb.1.gz

.include <bsd.port.pre.mk>

do-install:
	cd ${WRKSRC}/hw/vfb; ${MAKE} ${FAKE_MAKEARGS} install

.include <bsd.port.post.mk>
