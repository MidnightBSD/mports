PORTNAME=	ExtUtils-MakeMaker
PORTVERSION=	7.66
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Designed to write a Makefile for an extension module
WWW=		https://metacpan.org/release/ExtUtils-MakeMaker

LICENSE=	artistic gpl
LICENSE_COMB=	dual

CONFLICTS_INSTALL=	p5-ExtUtils-Command

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

post-patch:
	@${RM} -r ${WRKSRC}/bundled/

.include <bsd.port.mk>
