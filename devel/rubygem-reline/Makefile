PORTNAME=	reline
PORTVERSION=	0.6.3
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative GNU Readline or Editline implementation by pure Ruby
WWW=		https://github.com/ruby/reline

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

BUILD_DEPENDS=	rubygem-io-console>=0.5<1:devel/rubygem-io-console
RUN_DEPENDS=	rubygem-io-console>=0.5<1:devel/rubygem-io-console

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
