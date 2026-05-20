PORTNAME=	openssl
PORTVERSION=	3.3.2
CATEGORIES=	security rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrap the OpenSSL library
WWW=		https://github.com/ruby/openssl

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=	${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

USES=		cpe gem ssl

CPE_VENDOR=	ruby-lang

PORTSCOUT=	limit:^3\.

.include <bsd.port.mk>
