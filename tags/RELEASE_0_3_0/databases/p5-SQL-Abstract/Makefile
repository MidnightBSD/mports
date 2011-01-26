# New ports collection makefile for:	SQL-Abstract
# Date created:	   18 Feb 2003
# Whom:		   Dominic Mitchell <dom@happygiraffe.net>
#
# $FreeBSD: ports/databases/p5-SQL-Abstract/Makefile,v 1.9 2007/01/05 17:55:38 lbr Exp $
# $MidnightBSD: mports/databases/p5-SQL-Abstract/Makefile,v 1.2 2008/10/10 20:00:23 laffer1 Exp $
#

PORTNAME=	SQL-Abstract
PORTVERSION=	1.67
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to generate SQL from Perl data structures
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		SQL::Abstract.3 \
		SQL::Abstract::Test.3

post-extract:
	@${PERL} -i -ne 'print unless m,^test,' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
