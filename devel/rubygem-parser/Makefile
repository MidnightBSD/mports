PORTNAME=	parser
PORTVERSION=	3.3.8.0
CATEGORIES=	devel ruby
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby parser written in pure Ruby
WWW=		https://github.com/whitequark/parser

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-ast>=2.4.1<2.5:devel/rubygem-ast \
		rubygem-racc>=0:devel/rubygem-racc

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/ruby-parse \
		bin/ruby-rewrite

.include <bsd.port.mk>
