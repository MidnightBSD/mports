PORTNAME=	axel
DISTVERSIONPREFIX=	v
DISTVERSION=	2.17.14
CATEGORIES=	ftp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight CLI download accelerator
WWW=		https://github.com/axel-download-accelerator/axel

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	autoconf-archive>=0:devel/autoconf-archive \
		txt2man:textproc/txt2man

USES=		autoreconf gettext-tools gmake pkgconfig ssl

USE_GITHUB=	yes
GH_ACCOUNT=	axel-download-accelerator

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

.if exists(/usr/libdata/pkgconfig/openssl.pc)
CONFIGURE_ARGS=	--with-ssl=openssl
.else
CONFIGURE_ARGS=	--without-ssl # no easy workaround
.endif

PLIST_FILES=	bin/axel \
		man/man1/axel.1.gz

.include <bsd.port.mk>
