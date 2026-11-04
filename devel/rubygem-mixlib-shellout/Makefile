PORTNAME=	mixlib-shellout
PORTVERSION=	3.3.9
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run external commands on Unix or Windows
WWW=		https://www.chef.io/ \
		https://github.com/chef/mixlib-shellout

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-chef-utils>=0:sysutils/rubygem-chef-utils

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
