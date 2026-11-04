PORTNAME=	SQL-Abstract-Limit
PORTVERSION=	0.143
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SQL Portability layer for LIMIT emulation
WWW=		https://metacpan.org/release/SQL-Abstract-Limit

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-SQL-Abstract>=1.2:databases/p5-SQL-Abstract \
		p5-DBI>=0:databases/p5-DBI

USES=		dos2unix perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
