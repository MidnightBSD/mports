PORTNAME=	DBD-Pg
PORTVERSION=	3.21.1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TURNSTEP
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides access to PostgreSQL databases through the DBI
WWW=		https://metacpan.org/release/DBD-Pg

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/LICENSES/artistic.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DBI>=1.614:databases/p5-DBI

USES=		perl5 pgsql
USE_PERL5=	configure

# 3.21.1 calls plan() twice in t/03dbmethod.t, t/10_pg_error_field.t and
# t/30unicode.t when no PostgreSQL server is reachable, so the suite dies
# instead of skipping.
NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/DBD/Pg/Pg.so

.include <bsd.port.mk>
