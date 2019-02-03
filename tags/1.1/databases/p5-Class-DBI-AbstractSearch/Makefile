# $MidnightBSD$

PORTNAME=	Class-DBI-AbstractSearch
PORTVERSION=	0.07
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Abstract Class::DBI SQL with SQL::Abstract

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	${SITE_PERL}/Class/DBI.pm:databases/p5-Class-DBI \
		${SITE_PERL}/SQL/Abstract.pm:databases/p5-SQL-Abstract \
		${SITE_PERL}/SQL/Abstract/Limit.pm:databases/p5-SQL-Abstract-Limit
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
