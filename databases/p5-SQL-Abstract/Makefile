# $FreeBSD: ports/databases/p5-SQL-Abstract/Makefile,v 1.9 2007/01/05 17:55:38 lbr Exp $
# $MidnightBSD$

PORTNAME=	SQL-Abstract
PORTVERSION=	1.67
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to generate SQL from Perl data structures

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=	perl
PERL_CONFIGURE=	yes

post-extract:
	@${PERL} -i -ne 'print unless m,^test,' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
