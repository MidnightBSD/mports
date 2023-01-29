PORTNAME=	MCE
PORTVERSION=	1.881
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MARIOROY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Many-Core Engine for Perl providing parallel processing capabilities
WWW=		https://metacpan.org/release/MCE

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE_ART10=	${WRKSRC}/LICENSE
LICENSE_FILE_GPLv1+ =	${WRKSRC}/Copying

PORTSCOUT=	limit:^[0-9\.]*$$

NO_ARCH=	yes
NO_TEST=	yes

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
