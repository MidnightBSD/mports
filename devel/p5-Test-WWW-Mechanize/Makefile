PORTNAME=	Test-WWW-Mechanize
PORTVERSION=	1.60
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Testing-specific WWW::Mechanize subclass
WWW=		https://metacpan.org/release/Test-WWW-Mechanize

LICENSE=	artistic2

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Carp-Assert-More>=1.16:devel/p5-Carp-Assert-More \
		p5-HTML-Form>=0:www/p5-HTML-Form \
		p5-HTTP-Message>=6.29:www/p5-HTTP-Message \
		p5-HTML-Parser>=0:www/p5-HTML-Parser \
		p5-Test-LongString>=0.15:devel/p5-Test-LongString \
		p5-WWW-Mechanize>=1.68:www/p5-WWW-Mechanize \
		p5-libwww>=6.02:www/p5-libwww
TEST_DEPENDS=	p5-HTTP-Server-Simple>=0.42:www/p5-HTTP-Server-Simple \
		p5-URI>=0:net/p5-URI

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

.include <bsd.port.mk>
