PORTNAME=	magus-utils
PORTVERSION=	1.8
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        Magus runtime utilities for build cluster

LICENSE=	agg

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBD/Pg.pm:databases/p5-DBD-Pg \
		${SITE_PERL}/YAML.pm:textproc/p5-YAML \
		${SITE_PERL}/Class/DBI.pm:databases/p5-Class-DBI \
		${SITE_PERL}/Class/Accessor.pm:devel/p5-Class-Accessor \
		git:devel/git

USES=		perl5 pgsql:14

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
