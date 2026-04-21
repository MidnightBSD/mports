PORTNAME=	prime
PORTVERSION=	0.1.4
CATEGORIES=	math rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Prime numbers and factorization library
WWW=		https://github.com/ruby/prime

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-forwardable>=0:devel/rubygem-forwardable \
		rubygem-singleton>=0:devel/rubygem-singleton

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
