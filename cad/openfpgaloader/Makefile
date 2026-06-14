PORTNAME=	openfpgaloader
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.1
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal utility for programming FPGA
WWW=		https://github.com/trabucayre/openFPGALoader

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libftdi1.so:devel/libftdi1 \
		libhidapi.so:comms/hidapi \
		libudev.so:devel/libudev-devd

USES=		cmake compiler:c++11-lang localbase:ldflags pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	trabucayre
GH_PROJECT=	openFPGALoader

DATADIR=	${PREFIX}/share/openFPGALoader

.include <bsd.port.mk>
