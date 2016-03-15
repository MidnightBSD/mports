# $MidnightBSD$


PORTNAME=	Class-DBI-Plugin-Pager
PORTVERSION=	0.561
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to paged queries for CDBI

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/SQL/Abstract.pm:${PORTSDIR}/databases/p5-SQL-Abstract \
		${SITE_PERL}/UNIVERSAL/require.pm:${PORTSDIR}/devel/p5-UNIVERSAL-require \
		${SITE_PERL}/Data/Page.pm:${PORTSDIR}/databases/p5-Data-Page

USES=	perl
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
