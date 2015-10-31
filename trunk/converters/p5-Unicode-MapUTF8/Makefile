# $MidnightBSD$

PORTNAME=	Unicode-MapUTF8
PORTVERSION=	1.11
PORTREVISION=	1
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class that implements conversion between arbitrary charsets

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Unicode/Map.pm:${PORTSDIR}/converters/p5-Unicode-Map \
		${SITE_PERL}/${PERL_ARCH}/Unicode/String.pm:${PORTSDIR}/converters/p5-Unicode-String \
		${SITE_PERL}/${PERL_ARCH}/Unicode/Map8.pm:${PORTSDIR}/converters/p5-Unicode-Map8 \
		${SITE_PERL}/Jcode.pm:${PORTSDIR}/converters/p5-Jcode
RUN_DEPENDS=	${BUILD_DEPENDS}

USE_PERL5=	yes
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
