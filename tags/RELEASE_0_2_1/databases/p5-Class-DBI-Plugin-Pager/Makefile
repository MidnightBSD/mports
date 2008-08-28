# New ports collection makefile for:	Class-DBI-Plugin-Pager
# Date created:		25 Oct 2005
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD: ports/databases/p5-Class-DBI-Plugin-Pager/Makefile,v 1.3 2007/09/08 00:54:30 linimon Exp $
# $MidnightBSD$
#


PORTNAME=	Class-DBI-Plugin-Pager
PORTVERSION=	0.561
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Class
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
