# $MidnightBSD$

PORTNAME=	xorg-dmx
PORTREVISION=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed Multihead X from X.Org

LICENSE=	mit

MASTERDIR=	${.CURDIR}/../xorg-server
DESCR=		${.CURDIR}/pkg-descr
USE_XORG=	dmx xorgproto x11 xaw7 xext xfixes xi xmu xpm xrender xres xt xtst   

CONFIGURE_ARGS=	--disable-xephyr --disable-xvfb --disable-xnest \
		--without-xmlto	--disable-docs --disable-devel-docs \
		--enable-dmx --localstatedir=/var --without-dtrace \
		--disable-xwayland

SLAVE_PORT=	yes

do-install:
	cd ${WRKSRC}/hw/dmx; ${FAKE_MAKEENV} ${MAKE} ${FAKE_MAKEARGS} install

.include "${MASTERDIR}/Makefile"
