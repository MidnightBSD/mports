# $MidnightBSD$

PORTNAME=	Data-Dumper-Concise
PORTVERSION=	2.023
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FREW
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Less indentation and newlines plus sub deparsing

LICENSE=	artistic gpl
LICENSE_COMB=	dual

OPTIONS_DEFINE=	ARGNAMES
OPTIONS_DEFAULT=ARGNAMES
ARGNAMES_DESC=	Enable DwarnN subroutine

ARGNAMES_BUILD_DEPENDS=	p5-Devel-ArgNames>=0.03:devel/p5-Devel-ArgNames
ARGNAMES_RUN_DEPENDS=	p5-Devel-ArgNames>=0.03:devel/p5-Devel-ArgNames

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
