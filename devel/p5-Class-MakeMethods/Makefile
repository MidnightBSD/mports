# $MidnightBSD$

PORTNAME=	Class-MakeMethods
PORTVERSION=	1.010
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate common types of methods

LICENSE=	artistic gpl
LICENSE_COMB=	dual

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-extract:
		@${RM} ${WRKSRC}/benchmark.pl
		@${PERL} -pi -e '$$_="" if m|benchmark.pl|' ${WRKSRC}/MANIFEST

.include <bsd.port.mk>
