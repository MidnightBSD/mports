# $MidnightBSD$

PORTNAME=	libzip
PORTVERSION=	1.5.1
CATEGORIES=	archivers devel
MASTER_SITES=	https://libzip.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for reading, creating, and modifying ZIP archives

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

CPE_VENDOR=	nih

USES=		cmake:outsource cpe perl5 ssl tar:xz
USE_LDCONFIG=	yes
USE_PERL5=	test
NO_TEST=	yes

CMAKE_OFF=	ENABLE_COMMONCRYPTO ENABLE_GNUTLS

.include <bsd.port.mk>
