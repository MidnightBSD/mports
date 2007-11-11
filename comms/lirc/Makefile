# New ports collection makefile for:	lirc
# Date created:		4 January 2003
# Whom:			Mike Heffner <mikeh@FreeBSD.org>
#
# $MidnightBSD: mports/comms/lirc/Makefile,v 1.5 2007/11/11 00:13:36 laffer1 Exp $
# $FreeBSD: ports/comms/lirc/Makefile,v 1.22 2006/08/23 00:41:37 grog Exp $
#

PORTNAME=	lirc
PORTVERSION=	0.8.0
CATEGORIES=	comms
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	lirc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux Infared Remote Control
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_XLIB=	yes
USE_GETOPT_LONG=yes
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
