# Created by: Aaron Dalton <aaron@FreeBSD.org>

PORTNAME=	HTTP-SimpleLinkChecker
PORTVERSION=	1.167
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check the HTTP response code for a link

LICENSE=	artistic
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTTP-Message>=1.28:www/p5-HTTP-Message \
		p5-LWP-Protocol-https>=1:www/p5-LWP-Protocol-https \
		p5-Mojolicious>=4.50:www/p5-Mojolicious \
		p5-libwww>0:www/p5-libwww

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
