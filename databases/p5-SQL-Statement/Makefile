PORTNAME=	SQL-Statement
PORTVERSION=	1.412
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for SQL parsing and processing

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Clone>=0.30:devel/p5-Clone \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Params-Util>=1.00:devel/p5-Params-Util

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
