PORTNAME=	iconv
PORTVERSION=	1.1.0
CATEGORIES=	converters rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	iconv wrapper library
WWW=		https://github.com/ruby/iconv

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE.txt

USES=		gem iconv

CONFIGURE_ARGS=	--with-cflags=-Wno-incompatible-function-pointer-types

.include <bsd.port.mk>
