# $MidnightBSD$

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
		${JCODE}:${PORTSDIR}/converters/p5-Jcode
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Unicode::MapUTF8.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500801
JCODE=	${SITE_PERL}/${PERL_ARCH}/Jcode.pm
.else
JCODE=	${SITE_PERL}/Jcode.pm
.endif

.include <bsd.port.post.mk>
