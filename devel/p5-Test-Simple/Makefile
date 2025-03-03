PORTNAME=	Test-Simple
PORTVERSION=	1.302209
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic utilities for writing tests in perl
WWW=		https://metacpan.org/release/Test-Simple

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 504000
BUILD_DEPENDS+=	p5-Term-Table>=0.013:devel/p5-Term-Table
RUN_DEPENDS+=	p5-Term-Table>=0.013:devel/p5-Term-Table
.endif

.include <bsd.port.post.mk>
