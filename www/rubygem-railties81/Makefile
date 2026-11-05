PORTNAME=	railties
PORTVERSION=	8.1.4.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rails application bootup, plugins, generators, and rake tasks
WWW=		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack81=${PORTVERSION}:www/rubygem-actionpack81 \
		rubygem-activesupport81=${PORTVERSION}:devel/rubygem-activesupport81 \
		rubygem-irb>=1.13<2:devel/rubygem-irb \
		rubygem-rackup>=1.0.0:www/rubygem-rackup \
		rubygem-rake>=12.2:devel/rubygem-rake \
		rubygem-thor>=1.2.2<2:devel/rubygem-thor \
		rubygem-tsort>=0.2:devel/rubygem-tsort \
		rubygem-zeitwerk>=2.6<3:devel/rubygem-zeitwerk

USES=		gem shebangfix
NO_ARCH=	yes

PLIST_FILES=	bin/rails
CONFLICTS_INSTALL=	rubygem-railties[0-9] rubygem-railties[0-9][0-9]
SHEBANG_FILES=	lib/rails/generators/rails/app/templates/docker-entrypoint.tt

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
