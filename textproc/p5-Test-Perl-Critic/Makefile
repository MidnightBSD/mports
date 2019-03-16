# Created by: chinsan

PORTNAME=	Test-Perl-Critic
PORTVERSION=	1.04
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use Perl::Critic in test programs

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-MCE>=1.827:devel/p5-MCE \
		p5-Perl-Critic>=0:textproc/p5-Perl-Critic

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
