PORTNAME=	DateTime-Format-Japanese
PORTVERSION=	0.04000
PORTREVISION=	1
CATEGORIES=	japanese devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DMAKI

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese DateTime Formatter
WWW=		https://metacpan.org/release/DateTime-Format-Japanese

LICENSE=	NONE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime \
		p5-DateTime-Calendar-Japanese>=0.05:devel/p5-DateTime-Calendar-Japanese \
		ja-p5-DateTime-Calendar-Japanese-Era>=0.08000:japanese/p5-DateTime-Calendar-Japanese-Era \
		p5-DateTime-Format-Builder>=0:devel/p5-DateTime-Format-Builder \
		p5-Params-Validate>=0:devel/p5-Params-Validate

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
