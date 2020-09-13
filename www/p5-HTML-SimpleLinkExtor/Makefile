# Created by: Andrey Chernov <ache@FreeBSD.org>

PORTNAME=	HTML-SimpleLinkExtor
PORTVERSION=	1.272
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This is a simple HTML link extractor

LICENSE=	artistic
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Parser>=1.28:www/p5-HTML-Parser \
		p5-URI>=1.09:net/p5-URI \
		p5-libwww>=0:www/p5-libwww

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
