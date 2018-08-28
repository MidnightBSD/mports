# $MidnightBSD$

PORTNAME=	Class-MakeMethods
PORTVERSION=	1.010
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate common types of methods
LICENSE=	perl

PERL_CONFIGURE=	yes

post-extract:
		@${RM} ${WRKSRC}/benchmark.pl
		@${PERL} -pi -e '$$_="" if m|benchmark.pl|' ${WRKSRC}/MANIFEST

.include <bsd.port.mk>
