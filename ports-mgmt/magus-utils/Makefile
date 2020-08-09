# Created by: Lucas Holt

PORTNAME=	magus-utils
PORTVERSION=	1.6
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
		svn:devel/subversion

USES=		perl5
USE_PGSQL=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
