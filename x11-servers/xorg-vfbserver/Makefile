PORTNAME=	xorg-vfbserver
PORTEPOCH=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X virtual framebuffer server from X.Org

LICENSE=	mit

MASTERDIR=	${.CURDIR}/../xorg-server
DESCR=		${.CURDIR}/pkg-descr

SLAVE_PORT=	yes

CONFIGURE_ARGS+=--enable-xvfb --disable-dmx --disable-xephyr --disable-xnest \
		--disable-xwayland

PLIST_FILES=	bin/Xvfb man/man1/Xvfb.1.gz

do-install:
	cd ${WRKSRC}/hw/vfb; ${MAKE} ${FAKE_MAKEARGS} install

.include "${MASTERDIR}/Makefile"
