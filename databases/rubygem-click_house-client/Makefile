PORTNAME=	click_house-client
PORTVERSION=	0.8.8
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to ClickHouse databases
WWW=		https://gitlab.com/gitlab-org/ruby/gems/clickhouse-client

LICENSE=	mit

RUN_DEPENDS=	rubygem-activerecord-gitlab>=7<9:databases/rubygem-activerecord-gitlab \
		rubygem-activesupport-gitlab>=7<9:devel/rubygem-activesupport-gitlab \
		rubygem-addressable>=2.8<3:www/rubygem-addressable \
		rubygem-json>=2.7<3:devel/rubygem-json
BUILD_DEPENDS+=	rubygem-activerecord-gitlab>=7<9:databases/rubygem-activerecord-gitlab \
		rubygem-activesupport-gitlab>=7<9:devel/rubygem-activesupport-gitlab \
		rubygem-addressable>=2.8<3:www/rubygem-addressable \
		rubygem-json>=2.7<3:devel/rubygem-json

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
