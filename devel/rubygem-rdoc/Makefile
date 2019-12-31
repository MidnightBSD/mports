PORTNAME=	rdoc
PORTVERSION=	6.1.2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDoc produces HTML and command-line documentation for Ruby projects

LICENSE=	gpl2 ruby
LICENSE_COMB=	dual

USES=		gem
USE_RUBY=	yes

NO_ARCH=	yes

post-install:
	${RM} ${STAGEDIR}${PREFIX}/bin/rdoc ${STAGEDIR}${PREFIX}/bin/ri

.include <bsd.port.mk>
