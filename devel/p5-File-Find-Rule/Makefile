PORTNAME=	File-Find-Rule
PORTVERSION=	0.35
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative interface to File::Find
WWW=		https://metacpan.org/release/File-Find-Rule

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Number-Compare>=0:math/p5-Number-Compare \
		p5-Text-Glob>=0.07:textproc/p5-Text-Glob

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
