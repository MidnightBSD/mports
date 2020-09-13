# Created by: Anton Berezin <tobez@FreeBSD.org>

PORTNAME=	HTML-Lint
PORTVERSION=	2.32
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PETDANCE
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML::Lint - check for HTML errors in a string or file

LICENSE=	artistic

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Tagset>0:www/p5-HTML-Tagset \
		p5-libwww>0:www/p5-libwww \
		p5-HTML-Parser>0:www/p5-HTML-Parser

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
