# $MidnightBSD: mports/x11/xterm/Makefile,v 1.24 2012/10/04 18:53:27 laffer1 Exp $

PORTNAME=	xterm
PORTVERSION=	287
CATEGORIES=	x11
MASTER_SITES=	ftp://invisible-island.net/xterm/:src1 \
		CRITICAL:src1 CRITICAL:src2
EXTRACT_SUFX=	.tgz
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:src1 \
		bsd-xterm-icons-${ICONVERSION}${EXTRACT_SUFX}:src2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal emulator for the X Window System
LICENSE=	x11

BUILD_DEPENDS=	luit:${PORTSDIR}/x11/luit

USE_XORG=	xaw xft
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LIBS="-L${X11BASE}/lib"
CONFIGURE_ARGS+=--enable-wide-chars --enable-luit --with-utempter \
		--enable-narrowproto
CPPFLAGS+=	-I${LOCALBASE}/include
MAN1=		resize.1 koi8rxterm.1 uxterm.1 xterm.1

OPTIONS=	256_COLOR "Enable 256 Color Support." Off \
		GNOME	"Enable GNOME Integration" Off

ICONVERSION=	1

.include <bsd.mport.options.mk>

.if defined(WITH_GNOME)
USE_GNOME=	desktopfileutils
PLIST_SUB+=	GNOME=""
.else
PLIST_SUB+=	GNOME="@comment "
.endif

.if defined(WITH_256_COLOR)
CONFIGURE_ARGS+=	--enable-256-color
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4015
LIB_DEPENDS+=	utempter:${PORTSDIR}/sysutils/libutempter
.endif

post-extract:
	@${CP} ${WRKDIR}/bsd-xterm-icons-1/*.png ${WRKDIR}/bsd-xterm-icons-1/*.xpm \
		${WRKSRC}/icons/

post-install:
.for f in koi8rxterm resize uxterm xterm
	@${CHMOD} ${BINMODE} ${PREFIX}/bin/${f}
.endfor
	@${MKDIR} ${PREFIX}/share/applications/
	@${INSTALL_DATA} ${WRKSRC}/xterm.desktop ${PREFIX}/share/applications/

.include <bsd.port.post.mk>
