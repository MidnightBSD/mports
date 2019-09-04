PORTNAME=	Class-DBI-Plugin-Pager
PORTVERSION=	0.566
PORTREVISION=	1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to paged queries for CDBI

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-DBI>=0:databases/p5-Class-DBI \
		p5-SQL-Abstract>=1.61:databases/p5-SQL-Abstract \
		p5-UNIVERSAL-require>=0:devel/p5-UNIVERSAL-require \
		p5-Data-Page>=0:databases/p5-Data-Page \
		p5-Class-DBI-Plugin-AbstractCount>=0:databases/p5-Class-DBI-Plugin-AbstractCount

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
