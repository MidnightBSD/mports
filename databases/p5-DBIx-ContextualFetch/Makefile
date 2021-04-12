PORTNAME=	DBIx-ContextualFetch
PORTVERSION=	1.03
PORTREVISION=	1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Add contextual fetches to DBI

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:databases/p5-DBI
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>

