# $MidnightBSD$

PORTNAME=	pgtop
PORTVERSION=	0.05
CATEGORIES=	databases
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:COSIMO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display PostgreSQL performance info like top(1)

LICENSE=	unknown

RUN_DEPENDS=	p5-Term-ReadKey>=2.10:devel/p5-Term-ReadKey \
		p5-DBD-Pg>=1.22:databases/p5-DBD-Pg \
		p5-DBI>=1.16:databases/p5-DBI

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
