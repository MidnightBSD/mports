PORTNAME=	Term-ReadLine-Gnu
PORTVERSION=	1.46
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allow Term::ReadLine to use GNU readline
WWW=		https://metacpan.org/release/Term-ReadLine-Gnu

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5 readline
USE_PERL5=	configure

CONFIGURE_ARGS=	--prefix=${PREFIX}

CFLAGS+=	${CPPFLAGS}

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Term/ReadLine/Gnu/Gnu.so

.include <bsd.port.mk>
