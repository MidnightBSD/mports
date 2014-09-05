# $MidnightBSD$

PORTNAME=	Class-DBI-AbstractSearch
PORTVERSION=	0.07
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Abstract Class::DBI SQL with SQL::Abstract
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/SQL/Abstract.pm:${PORTSDIR}/databases/p5-SQL-Abstract \
		${SITE_PERL}/SQL/Abstract/Limit.pm:${PORTSDIR}/databases/p5-SQL-Abstract-Limit
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
