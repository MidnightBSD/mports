PORTNAME=	Time-Piece
PORTVERSION=	1.3300
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:S|00$||}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-oriented time objects for Perl
WWW=		https://metacpan.org/release/Time-Piece

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Time/Piece/Piece.so

.include <bsd.port.mk>
