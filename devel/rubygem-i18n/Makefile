PORTNAME=	i18n
PORTVERSION=	1.14.6
PORTEPOCH=	2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	New wave Internationalization support for Ruby
WWW=		https://github.com/ruby-i18n/i18n

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	rubygem-concurrent-ruby>=1.0<2:devel/rubygem-concurrent-ruby
RUN_DEPENDS=	rubygem-concurrent-ruby>=1.0<2:devel/rubygem-concurrent-ruby

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	i18n_project

.include <bsd.port.mk>
