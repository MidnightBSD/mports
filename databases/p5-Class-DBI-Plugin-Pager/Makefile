# $MidnightBSD: mports/databases/p5-Class-DBI-Plugin-Pager/Makefile,v 1.2 2009/10/13 23:31:03 laffer1 Exp $


PORTNAME=	Class-DBI-Plugin-Pager
PORTVERSION=	0.561
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Perl extension to paged queries for CDBI
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/SQL/Abstract.pm:${PORTSDIR}/databases/p5-SQL-Abstract \
		${SITE_PERL}/UNIVERSAL/require.pm:${PORTSDIR}/devel/p5-UNIVERSAL-require \
		${SITE_PERL}/Data/Page.pm:${PORTSDIR}/databases/p5-Data-Page

PERL_CONFIGURE=	yes
MAN3=		Class::DBI::Plugin::Pager.3

.include <bsd.port.mk>
