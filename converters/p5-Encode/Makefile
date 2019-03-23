# $MidnightBSD$

PORTNAME=	Encode
PORTVERSION=	3.01
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DANKOGAI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides interfaces between strings and the rest of the system

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5

post-patch:
	@${REINPLACE_CMD} -e 's|bin/enc2xs||; s|bin/piconv||' ${WRKSRC}/Makefile.PL
	@${REINPLACE_CMD} -e 's|bin/encguess||' ${WRKSRC}/Makefile.PL

post-install:
	${FIND} ${PREFIX}/${SITE_ARCH_REL}/auto/Encode/ -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
