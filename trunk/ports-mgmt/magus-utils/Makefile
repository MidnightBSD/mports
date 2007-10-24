# New ports collection makefile for: magus-utils
# Date created:		24 Oct 2007
# Whom:			Lucas Holt
#
# $MidnightBSD$
#

PORTNAME=	magus-utils
PORTVERSION=	1.0
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        mports magus runtime utilities for build cluster

RUN_DEPENDS=	mysql:${PORTSDIR}/databases/mysql50-client \
		${SITE_PERL}/YAML.pm:${PORTSDIR}/textproc/p5-YAML \
		${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install: # empty

.include <bsd.port.mk>
