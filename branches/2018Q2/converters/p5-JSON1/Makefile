# $MidnightBSD$

PORTNAME=	JSON
PORTVERSION=	1.15
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to convert to JSON (JavaScript Object Notation)

LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/HTTP/Request.pm:${PORTSDIR}/www/p5-libwww
BUILD_DEPENDS=	${RUN_DEPENDS}

CONFLICTS=	p5-JSON-2.*
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
