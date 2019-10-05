# Created by: Sylvio Cesar <sylvio@FreeBSD.org>

PORTNAME=	lzip
PORTVERSION=	1.21
CATEGORIES=	archivers
MASTER_SITES=	SAVANNAH/lzip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lossless data compressor based on the LZMA algorithm

LICENSE=	gpl3

PLIST_FILES=	bin/lzip \
		man/man1/lzip.1.gz

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	CXX="${CXX}" \
		CXXFLAGS="${CXXFLAGS}" \
		LDFLAGS="${LDFLAGS}"
INFO=		lzip

.include <bsd.port.mk>
