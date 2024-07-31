PORTNAME=	ccid
PORTVERSION=	1.5.5
CATEGORIES=	devel
MASTER_SITES=	https://ccid.apdu.fr/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic driver for USB CCID and ICCD
WWW=		https://ccid.apdu.fr/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpcsclite.so:devel/pcsc-lite

USES=		perl5 pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_PERL5=	build

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-usbdropdir=${PREFIX}/lib/pcsc/drivers \
		--enable-ccidtwindir=${PREFIX}/lib/pcsc/drivers/serial
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

INSTALL_TARGET=	install-strip

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/contrib/RSA_SecurID/RSA_SecurID_getpasswd \
		${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/contrib/RSA_SecurID/RSA_SecurID_getpasswd.1 \
		${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
