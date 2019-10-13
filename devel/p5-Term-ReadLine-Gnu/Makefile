PORTNAME=	Term-ReadLine-Gnu
PORTVERSION=	1.36
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allow Term::ReadLine to use GNU readline

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5 readline
USE_PERL5=	configure

CFLAGS+=	${CPPFLAGS}

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Term/ReadLine/Gnu/Gnu.so

.include <bsd.port.mk>
