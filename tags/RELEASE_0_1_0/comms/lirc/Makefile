# New ports collection makefile for:	lirc
# Date created:		4 January 2003
# Whom:			Mike Heffner <mikeh@FreeBSD.org>
#
# $MidnightBSD: mports/comms/lirc/Makefile,v 1.2 2007/04/19 21:55:49 ctriv Exp $
# $FreeBSD: ports/comms/lirc/Makefile,v 1.22 2006/08/23 00:41:37 grog Exp $
#

PORTNAME=	lirc
PORTVERSION=	0.7.2
CATEGORIES=	comms
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	lirc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux Infared Remote Control

USE_XLIB=	yes
USE_GETOPT_LONG=yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=		--disable-manage-devices --with-devdir=/var/lirc

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
LIB_DEPENDS+=	vga:${PORTSDIR}/graphics/svgalib
PLIST_SUB+=	SMODE2=
.else
PLIST_SUB+=	SMODE2="@comment "
.endif

BUILD_DEPENDS+=		${LOCALBASE}/lib/libirman.a:${PORTSDIR}/comms/libirman
CONFIGURE_ARGS+=	--with-driver=irman
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
CONFIGURE_ENV+=		CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"

MAN1=		ircat.1 irexec.1 irpty.1 irrecord.1 irsend.1 irw.1 \
		irxevent.1 mode2.1 smode2.1 xmode2.1
MAN8=		lircd.8 lircmd.8

.include <bsd.port.post.mk>
