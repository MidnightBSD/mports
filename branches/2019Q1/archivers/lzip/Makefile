# Created by: Sylvio Cesar <sylvio@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/archivers/lzip/Makefile 346728 2014-03-02 01:40:36Z gerald $

PORTNAME=	lzip
PORTVERSION=	1.15
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
