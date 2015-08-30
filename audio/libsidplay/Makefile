# Created by: Stefan Zehl <sec@42.org>
# $MidnightBSD$
# $FreeBSD: head/audio/libsidplay/Makefile 366790 2014-08-31 16:39:31Z tijl $

PORTNAME=	libsidplay
PORTVERSION=	1.36.59
PORTREVISION=	1
CATEGORIES=	audio emulators
MASTER_SITES=	http://bsd-geek.de/FreeBSD/distfiles/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commodore SID-chip emulator library to play SID music files

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	sid_cv_have_ios_binary=yes
INSTALL_TARGET=	install-strip
USES=		libtool
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
CONFIGURE_ARGS=	--enable-optendian --enable-optfixpoint
.endif

.include <bsd.port.post.mk>
