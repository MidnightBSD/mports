# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	Specio
PORTVERSION=	0.43
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DROLSKY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Type constraints and coercions for Perl

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Devel-StackTrace>=0:devel/p5-Devel-StackTrace \
		p5-Eval-Closure>=0:devel/p5-Eval-Closure \
		p5-MRO-Compat>=0:devel/p5-MRO-Compat \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Role-Tiny>=1.003003:devel/p5-Role-Tiny \
		p5-Sub-Quote>=0:devel/p5-Sub-Quote \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny
RUN_DEPENDS:=	${BUILD_DEPENDS}

NO_ARCH=	yes
NO_TEST=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
