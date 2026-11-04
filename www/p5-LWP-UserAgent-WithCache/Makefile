PORTNAME=	LWP-UserAgent-WithCache
PORTVERSION=	0.13
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LWP::UserAgent extension with local cache
WWW=		https://metacpan.org/release/LWP-UserAgent-WithCache

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Cache-Cache>=0:devel/p5-Cache-Cache \
		p5-File-HomeDir>=0:devel/p5-File-HomeDir \
		p5-libwww>=0:www/p5-libwww

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
