PORTNAME=	DateTime-Calendar-Japanese
PORTVERSION=	0.06001
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DMAKI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DateTime Extension for Traditional Japanese Calendars
WWW=		https://metacpan.org/release/DateTime-Calendar-Japanese

LICENSE=	NONE

BUILD_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime \
		p5-DateTime-Util-Calc>=0:devel/p5-DateTime-Util-Calc \
		p5-DateTime-Calendar-Chinese>=0:devel/p5-DateTime-Calendar-Chinese \
		p5-DateTime-Event-Sunrise>=0:devel/p5-DateTime-Event-Sunrise \
		ja-p5-DateTime-Calendar-Japanese-Era>=0:japanese/p5-DateTime-Calendar-Japanese-Era \
		p5-Params-Validate>=0:devel/p5-Params-Validate \
		p5-YAML>0:textproc/p5-YAML
RUN_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime \
		p5-DateTime-Util-Calc>=0:devel/p5-DateTime-Util-Calc \
		p5-DateTime-Calendar-Chinese>=0:devel/p5-DateTime-Calendar-Chinese \
		p5-DateTime-Event-Sunrise>=0:devel/p5-DateTime-Event-Sunrise \
		ja-p5-DateTime-Calendar-Japanese-Era>=0:japanese/p5-DateTime-Calendar-Japanese-Era \
		p5-Params-Validate>=0:devel/p5-Params-Validate \
		p5-YAML>0:textproc/p5-YAML

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
