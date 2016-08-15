# $MidnightBSD$

PORTNAME=	Unicode-Map
PORTVERSION=	0.112
PORTREVISION=	1
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class that converts strings to/from 2-byte Unicode UCS2 format

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
PERL_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Unicode/Map/Map.so

.include <bsd.port.mk>
