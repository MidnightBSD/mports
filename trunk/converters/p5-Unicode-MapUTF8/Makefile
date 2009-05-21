# $MidnightBSD: mports/converters/p5-Unicode-MapUTF8/Makefile,v 1.1 2009/05/21 14:49:16 laffer1 Exp $

PORTNAME=	Unicode-MapUTF8
PORTVERSION=	1.11
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class that implements conversion between arbitrary charsets
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Unicode/Map.pm:${PORTSDIR}/converters/p5-Unicode-Map \
		${SITE_PERL}/${PERL_ARCH}/Unicode/String.pm:${PORTSDIR}/converters/p5-Unicode-String \
		${SITE_PERL}/${PERL_ARCH}/Unicode/Map8.pm:${PORTSDIR}/converters/p5-Unicode-Map8 \
		${SITE_PERL}/Jcode.pm:${PORTSDIR}/converters/p5-Jcode
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Unicode::MapUTF8.3

.include <bsd.port.post.mk>
