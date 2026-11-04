PORTNAME=	bio-shell
PORTVERSION=	1.0.1
CATEGORIES=	biology rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line interface on BioRuby
WWW=		https://github.com/bioruby/bioruby-shell

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

BUILD_DEPENDS=	rubygem-bio>=2.0.0:biology/rubygem-bio
RUN_DEPENDS=	rubygem-bio>=2.0.0:biology/rubygem-bio

USES=		gem

NO_ARCH=	yes

CONFLICTS_INSTALL=	ruby??-bio

PLIST_FILES=	bin/bioruby

.include <bsd.port.mk>
