PORTNAME=	Email-Send
PORTVERSION=	2.202
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for simple email sending
WWW=		https://metacpan.org/release/Email-Send

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

DEPRECATED=	Send it's being officially marked "out of favor". Consider using mail/p5-Email-Sender for new projects

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Email-Abstract>=0:mail/p5-Email-Abstract \
		p5-Email-Address>=1.800:mail/p5-Email-Address \
		p5-Email-Simple>=1.92:mail/p5-Email-Simple \
		p5-Module-Pluggable>=2.97:devel/p5-Module-Pluggable \
		p5-Return-Value>=0:devel/p5-Return-Value

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
