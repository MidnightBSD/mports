PORTNAME=	SoapySDR
DISTVERSIONPREFIX=	soapy-sdr-
DISTVERSION=	0.8.1
PORTREVISION=	1
CATEGORIES=	misc hamradio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vendor and platform neutral SDR support library
WWW=		https://github.com/pothosware/SoapySDR

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE_1_0.txt

USES=		cmake compiler:c++11-lang
USE_GITHUB=	yes
GH_ACCOUNT=	pothosware
USE_LDCONFIG=	yes

LDFLAGS+=	-pthread

.include <bsd.port.mk>
