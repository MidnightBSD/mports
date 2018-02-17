# $MidnightBSD$

PORTNAME=	libassuan
PORTVERSION=	2.5.1
CATEGORIES=	security devel
MASTER_SITES=	GNUPG/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC library used by GnuPG and gpgme

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libgpg-error.so:security/libgpg-error

USES=		libtool tar:bzip2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

INFO=		assuan

.include <bsd.port.mk>
