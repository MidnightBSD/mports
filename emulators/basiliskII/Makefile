# $MidnightBSD: mports/emulators/basiliskII/Makefile,v 1.5 2010/04/27 13:20:58 laffer1 Exp $
# $FreeBSD: ports/emulators/basiliskII/Makefile,v 1.30 2007/01/23 19:08:20 miwi Exp $

PORTNAME=	basiliskII
PORTVERSION=	1.0
PORTREVISION=	6
CATEGORIES=	emulators
#MASTER_SITES=	http://gwenole.beauchesne.info/projects/basilisk2/files/
#MASTER_SITE_SUBDIR=	basilisk
DISTNAME=	BasiliskII_src_01052006

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free, portable, Open Source 68k Mac emulator
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/BasiliskII-${PORTVERSION}/src/Unix

USE_XLIB=	yes
USE_BZIP2=	yes
USE_GNOME=	esound gtk20
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--disable-fbdev-dga --enable-fpe=uae ac_cv_have_33bit_addressing=no ac_cv_file__dev_ptmx=no \
		--x-includes=${LOCALBASE}/include --x-libraries=${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

MAN1=		BasiliskII.1
CFLAGS=		-fpermissive

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
BROKEN=	does not compile on AMD64 architectures
.endif

.include <bsd.port.post.mk>
