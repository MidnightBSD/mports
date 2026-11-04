PORTNAME=	marisa-trie
DISTVERSIONPREFIX=	v
DISTVERSION=	0.3.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MARISA: Matching Algorithm with Recursively Implemented StorAge
WWW=		https://github.com/s-yata/marisa-trie

LICENSE=	bsd2 lgpl2.1+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/COPYING.md

USES=		cmake:testing compiler:c++20-lang pathfix
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	s-yata

CMAKE_ON_amd64=	ENABLE_NATIVE_CODE
CMAKE_ON=	BUILD_SHARED_LIBS \
		${CMAKE_ON_${ARCH}}

.include <bsd.port.mk>
