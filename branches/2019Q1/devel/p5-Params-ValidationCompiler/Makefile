# $MidnightBSD$
# $FreeBSD: head/devel/p5-Params-ValidationCompiler/Makefile 462157 2018-02-17 13:40:28Z wen $

PORTNAME=	Params-ValidationCompiler
PORTVERSION=	0.27
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build an optimized subroutine parameter validator once, use it forever

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Exception-Class>=0:devel/p5-Exception-Class \
		p5-Eval-Closure>=0:devel/p5-Eval-Closure
RUN_DEPENDS=	p5-Exception-Class>=0:devel/p5-Exception-Class \
		p5-Eval-Closure>=0:devel/p5-Eval-Closure \
		p5-Specio>=0.14:devel/p5-Specio
TEST_DEPENDS=	p5-Test2-Suite>=0:devel/p5-Test2-Suite \
		p5-Test2-Plugin-NoWarnings>=0:devel/p5-Test2-Plugin-NoWarnings \
		p5-Test-Without-Module>=0:devel/p5-Test-Without-Module

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
