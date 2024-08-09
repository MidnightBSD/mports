PORTNAME=	magus-utils
PORTVERSION=	1.8
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        Magus runtime utilities for build cluster

LICENSE=	agg

RUN_DEPENDS=	p5-DBD-Pg>=0:databases/p5-DBD-Pg \
		p5-YAML>=0:textproc/p5-YAML \
		p5-Class-DBI>=0:databases/p5-Class-DBI \
		p5-Class-Accessor>=0:devel/p5-Class-Accessor \
		git:devel/git

USES=		perl5 pgsql:14

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
