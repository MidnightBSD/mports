PORTNAME=	Date-Japanese-Holiday
PORTVERSION=	0.05
PORTREVISION=	3
CATEGORIES=	japanese perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for Calculate Japanese Holiday
WWW=		https://metacpan.org/release/Date-Japanese-Holiday

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Date-Calc>5.3:devel/p5-Date-Calc \
		p5-Date-Simple>1.03:devel/p5-Date-Simple \
		p5-Time-modules>0.01:devel/p5-Time-modules

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
