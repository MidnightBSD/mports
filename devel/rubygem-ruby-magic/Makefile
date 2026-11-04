PORTNAME=	ruby-magic
PORTVERSION=	0.6.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File Magic in ruby
WWW=		https://github.com/kwilczynski/ruby-magic

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-mini_portile2>=2.8<3:devel/rubygem-mini_portile2

USES=		gem
CONFIGURE_ARGS+=	--use-system-libraries

post-install:
	${RMDIR} ${PREFIX}/${GEM_LIB_DIR}/ports

.include <bsd.port.mk>
