# New ports collection makefile for:	nasm
# Date created:        7 April 1998
# Whom:                Murray Stokely <murray@cdrom.com>
#
# $MidnightBSD: mports/devel/nasm/Makefile,v 1.5 2007/08/25 06:23:43 laffer1 Exp $
# $FreeBSD: ports/devel/nasm/Makefile,v 1.28 2006/05/04 21:40:56 edwin Exp $
#

PORTNAME=	nasm
PORTVERSION=	0.98.39
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	devel lang
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nasm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose multi-platform x86 assembler
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
DESTDIRNAME=	INSTALLROOT
PLIST_SUB=	VERSION=${PORTVERSION}

PLIST_FILES=	bin/nasm bin/nasm-%%VERSION%% bin/ndisasm

MAN1=		nasm.1 ndisasm.1

post-patch:
	@${REINPLACE_CMD} -e 's|-std=c99||' ${WRKSRC}/configure

post-install:
	${LN} -sf nasm ${PREFIX}/bin/${DISTNAME}

.include <bsd.port.mk>
