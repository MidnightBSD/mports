PORTNAME=	Lingua-JA-Summarize-Extract
PORTVERSION=	0.02
PORTREVISION=	2
CATEGORIES=	japanese textproc perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Summary generator for Japanese
WWW=		https://metacpan.org/release/Lingua-JA-Summarize-Extract

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Accessor>=0:devel/p5-Class-Accessor \
		p5-UNIVERSAL-require>=0:devel/p5-UNIVERSAL-require \
		p5-Module-Install>=0:devel/p5-Module-Install

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
