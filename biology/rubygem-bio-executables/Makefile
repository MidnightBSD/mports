PORTNAME=	bio-executables
PORTVERSION=	1.0.0
CATEGORIES=	biology rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of miscellaneous utilities for bioinformatics
WWW=		https://github.com/bioruby/bioruby-executables

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

RUN_DEPENDS=	rubygem-bio>=2.0.0:biology/rubygem-bio \
		rubygem-bio-old-biofetch-emulator>=0.0.1:biology/rubygem-bio-old-biofetch-emulator

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/br_biofetch.rb \
		bin/br_bioflat.rb \
		bin/br_biogetseq.rb \
		bin/br_pmfetch.rb

.include <bsd.port.mk>
