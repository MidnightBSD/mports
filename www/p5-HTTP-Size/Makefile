# Created by: Aaron Dalton <aaron@FreeBSD.org>

PORTNAME=	HTTP-Size
PORTVERSION=	1.151
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get the byte size of an internet resource

LICENSE=	artistic
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-SimpleLinkExtor>=0:www/p5-HTML-SimpleLinkExtor \
		p5-HTTP-Message>=0:www/p5-HTTP-Message \
		p5-URI>=0:net/p5-URI \
		p5-libwww>=0:www/p5-libwww

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
