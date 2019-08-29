PORTNAME=	YAML
PORTVERSION=	1.27
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	YAML implementation in Perl

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes
# test yaml depends on this and vice versa causing a loop. we wont test this

.include <bsd.port.mk>
