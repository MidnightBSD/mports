PORTNAME=	SQL-Abstract-Classic
PORTVERSION=	1.91
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate SQL from Perl data structures
WWW=		https://metacpan.org/release/SQL-Abstract-Classic

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-MRO-Compat>=0.12:devel/p5-MRO-Compat \
		p5-SQL-Abstract>=1.79:databases/p5-SQL-Abstract

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
