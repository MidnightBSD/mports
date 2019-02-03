# $MidnightBSD$

PORTNAME=	xscreensaver-gnome-hacks
PORTREVISION=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Screensaver modules for use with xscreensaver and gnome-screensaver
LICENSE=	agg

MASTERDIR=	${.CURDIR}/../xscreensaver-gnome
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

CONFLICTS=	xscreensaver-[0-9]* xscreensaver-gnome-[0-9]*

OPTIONS_DEFINE=	ALL_FORTUNES
ALL_FORTUNES_DESC=	Enable support for all fortunes

EXTRA_PATCHES=	${FILESDIR}/extra-patch-nodriver

SS_SCRIPTS=	xscreensaver-getimage-desktop xscreensaver-getimage-file \
		xscreensaver-getimage xscreensaver-getimage-video \
		xscreensaver-text

post-build:
	@cd ${WRKSRC}/driver && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
		Makefile ${MAKE_ARGS} ${FAKE_MAKEARGS} xscreensaver-getimage

post-install-slave:
	${MKDIR} ${PREFIX}/bin
.for sf in ${SS_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/driver/${sf} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/driver/${sf}.man \
		${MAN1PREFIX}/man/man1/${sf}.1
.endfor

.include "${MASTERDIR}/Makefile"
