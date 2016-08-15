# $MidnightBSD$

PORTNAME=	basiliskII
PORTVERSION=	1.0
PORTREVISION=	8
CATEGORIES=	emulators
DISTNAME=	BasiliskII_src_01052006

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free, portable, Open Source 68k Mac emulator

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/BasiliskII-${PORTVERSION}/src/Unix

USES=		gmake tar:bzip2
USE_XORG=	x11
USE_XLIB=	yes
USE_GNOME=	esound gtk20
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-fbdev-dga --enable-fpe=uae ac_cv_have_33bit_addressing=no ac_cv_file__dev_ptmx=no \
		--x-includes=${LOCALBASE}/include --x-libraries=${LOCALBASE}/lib
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib -lpthread
#ONLY_FOR_ARCHS=	i386

CFLAGS=		-fpermissive

.include <bsd.port.mk>
