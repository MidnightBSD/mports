# $MidnightBSD: mports/x11/wterm/Makefile,v 1.5 2008/08/20 20:29:14 laffer1 Exp $
# $FreeBSD: ports/x11/wterm/Makefile,v 1.26 2006/11/30 22:44:28 dougb Exp $

PORTNAME=	wterm
PORTVERSION=	6.2.9
PORTREVISION=	3
CATEGORIES=	x11 windowmaker
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}.tar.gz

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	A color vt102 terminal emulator with transparency support
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/lib/libWINGs.a:${PORTSDIR}/x11-wm/windowmaker

USE_XORG=	xpm
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-transparency --enable-xpm-background \
		--disable-delete-key --disable-backspace-key \
		--enable-next-scrollbar --enable-utmp --enable-wtmp \
		--enable-menubar --enable-graphics --with-term=xterm-color \
		--with-xpm-includes=${LOCALBASE} --with-xpm-library=${LOCALBASE} \
		--libdir=${PREFIX}/lib
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -L${PREFIX}/lib" LDFLAGS="-L${PREFIX}/lib"

MAN1=		wterm.1
PLIST_FILES=	bin/wterm

post-extract:
	${RM} -f ${WRKSRC}/config.cache
	${RM} -f ${WRKSRC}/src/*.o

post-install:
	@${CHMOD} 4711 ${PREFIX}/bin/wterm

.include <bsd.port.mk>
