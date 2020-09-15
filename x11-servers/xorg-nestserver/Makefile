# $MidnightBSD$

PORTNAME=	xorg-nestserver
PORTEPOCH=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nesting X server from X.Org

LICENSE=	mit

MASTERDIR=	${.CURDIR}/../xorg-server
DESCR=		${.CURDIR}/pkg-descr

RUN_DEPENDS=	xkeyboard-config>=2.5:x11/xkeyboard-config

SLAVE_PORT=	yes
USE_XORG=	x11 xext

CONFIGURE_ARGS+=--enable-xnest --disable-dmx --disable-xephyr --disable-xvfb \
		--disable-xwayland

PLIST_FILES=	bin/Xnest man/man1/Xnest.1.gz

do-install:
	cd ${WRKSRC}/hw/xnest; DESTDIR=${FAKE_DESTDIR} ${MAKE} ${FAKE_MAKEARGS} install

.include "${MASTERDIR}/Makefile"
