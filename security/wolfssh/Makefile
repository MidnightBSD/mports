PORTNAME=	wolfssh
PORTVERSION=	1.4.10
CATEGORIES=	security
MASTER_SITES=	https://www.wolfssl.com/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight SSH Library
WWW=		https://www.wolfssl.com/products/wolfssh/

LICENSE=	gpl3

LIB_DEPENDS=	libwolfssl.so:security/wolfssl

USES=		autoreconf libtool localbase

CONFIGURE_ARGS=	--enable-fwd \
		--enable-keygen \
		--enable-scp \
		--enable-sftp \
		--enable-shared=yes \
		--enable-shell \
		--enable-static=yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
#TEST_TARGET=	check

NO_TEST=	yes

.include <bsd.port.mk>
