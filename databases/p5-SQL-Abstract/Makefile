# $FreeBSD: ports/databases/p5-SQL-Abstract/Makefile,v 1.9 2007/01/05 17:55:38 lbr Exp $
# $MidnightBSD$

PORTNAME=	SQL-Abstract
PORTVERSION=	1.81
PORTREVISION=	1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to generate SQL from Perl data structures

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Hash-Merge>=0.12:${PORTSDIR}/textproc/p5-Hash-Merge
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Moo>=1.004002:${PORTSDIR}/devel/p5-Moo \
		p5-Test-Deep>=0.101:${PORTSDIR}/devel/p5-Test-Deep \
		p5-Test-Exception>=0.31:${PORTSDIR}/devel/p5-Test-Exception \
		p5-Test-Warn>=0:${PORTSDIR}/devel/p5-Test-Warn

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
