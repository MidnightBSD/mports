PORTNAME=	lzip
PORTVERSION=	1.25
CATEGORIES=	archivers
MASTER_SITES=	SAVANNAH/lzip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lossless data compressor based on the LZMA algorithm
WWW=		https://www.nongnu.org/lzip/

LICENSE=	gpl2

PLIST_FILES=	bin/lzip \
		share/man/man1/lzip.1.gz

USES=		gmake
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	CXX="${CXX}" \
		CXXFLAGS="${CXXFLAGS}" \
		LDFLAGS="${LDFLAGS}"
INSTALL_TARGET=	install-strip
INFO=		lzip

.include <bsd.port.mk>
