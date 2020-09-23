# Created by: Stefan Zehl <sec@42.org>

PORTNAME=	libsidplay
PORTVERSION=	1.36.59
PORTREVISION=	2
CATEGORIES=	audio emulators
MASTER_SITES=	http://bsd-geek.de/FreeBSD/distfiles/ \
		FREEBSD_LOCAL/ehaupt
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commodore SID-chip emulator library to play SID music files

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	sid_cv_have_ios_binary=yes
INSTALL_TARGET=	install-strip
USES=		autoreconf libtool tar:tgz
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
CONFIGURE_ARGS=	--enable-optendian --enable-optfixpoint
.endif

.include <bsd.port.post.mk>
