PORTNAME=	JSON
PORTVERSION=	1.15
PKGNAMESUFFIX=	1
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to convert to JSON (JavaScript Object Notation)

LICENSE=	perl

RUN_DEPENDS=	p5-libwww>=0:www/p5-libwww
BUILD_DEPENDS=	${RUN_DEPENDS}

CONFLICTS=	p5-JSON-2.*

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
