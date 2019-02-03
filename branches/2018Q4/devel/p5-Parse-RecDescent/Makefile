# $MidnightBSD$

PORTNAME=	Parse-RecDescent
PORTVERSION=	1.967.009
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Recursive descent parsing framework for Perl

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
PERL_CONFIGURE=	YES

post-install:
	@${MKDIR} ${DOCSDIR}/tutorial
	${INSTALL_DATA} ${WRKSRC}/tutorial/* ${DOCSDIR}/tutorial

.include <bsd.port.mk>
