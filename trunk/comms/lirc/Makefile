# $MidnightBSD: mports/comms/lirc/Makefile,v 1.9 2009/12/31 23:24:32 laffer1 Exp $

PORTNAME=	lirc
PORTVERSION=	0.8.0
CATEGORIES=	comms
MASTER_SITES=	SF/${PORTNAME}/LIRC/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux Infared Remote Control
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_XORG=	x11
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=		--enable-sandboxed --with-devdir=/var/run/lirc

USE_RC_SUBR=  lircd.sh

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
LIB_DEPENDS+=	vga:${PORTSDIR}/graphics/svgalib
PLIST_SUB+=	SMODE2=
.else
PLIST_SUB+=	SMODE2="@comment "
.endif

BUILD_DEPENDS+=		${LOCALBASE}/lib/libirman.a:${PORTSDIR}/comms/libirman
CONFIGURE_ARGS+=	--with-driver=irman --with-driver=dvico
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
CONFIGURE_ENV+=		CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"

MAN1=		ircat.1 irexec.1 irpty.1 irrecord.1 irsend.1 irw.1 \
		irxevent.1 lircrcd.1 mode2.1 smode2.1 xmode2.1
MAN8=		lircd.8 lircmd.8

post-install:
	${MKDIR} /var/run/lirc

.include <bsd.port.post.mk>
