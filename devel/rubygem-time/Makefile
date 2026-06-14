PORTNAME=	time
PORTVERSION=	0.4.2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extend the Time class with methods for parsing and conversion
WWW=		https://github.com/ruby/time

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-date>=0:devel/rubygem-date

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
