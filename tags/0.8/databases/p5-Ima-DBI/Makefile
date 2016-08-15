# $MidnightBSD$

PORTNAME=	Ima-DBI
PORTVERSION=	0.35
PORTREVISION=	1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/P/PE/PERRIN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Database connection caching and organization
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/DBIx/ContextualFetch.pm:${PORTSDIR}/databases/p5-DBIx-ContextualFetch \
		${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI \
		${SITE_PERL}/Class/Data/Inheritable.pm:${PORTSDIR}/devel/p5-Class-Data-Inheritable
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=	perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
