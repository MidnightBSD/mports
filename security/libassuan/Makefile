PORTNAME=	libassuan
PORTVERSION=	3.0.2
CATEGORIES=	security devel
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPC library used by GnuPG and gpgme
WWW=		https://gnupg.org/related_software/libassuan/index.en.html

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libgpg-error.so:security/libgpg-error

USES=		libtool pathfix tar:bzip2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

INFO=		assuan

.include <bsd.port.mk>
