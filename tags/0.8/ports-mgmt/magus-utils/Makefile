# Created by: Lucas Holt
# $MidnightBSD$

PORTNAME=	magus-utils
PORTVERSION=	1.6
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        Magus runtime utilities for build cluster

LICENSE=	agg

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBD/Pg.pm:${PORTSDIR}/databases/p5-DBD-Pg \
		${SITE_PERL}/YAML.pm:${PORTSDIR}/textproc/p5-YAML \
		${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor \
		svn:${PORTSDIR}/devel/subversion

USE_PERL5=	yes
USE_PGSQL=	yes

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
