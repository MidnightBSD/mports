PORTNAME=	Test-Spelling
PORTVERSION=	0.25
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check for spelling errors in POD files

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Pod-Spell>=0:textproc/p5-Pod-Spell \
		p5-IPC-Run3>=0:devel/p5-IPC-Run3
RUN_DEPENDS=	p5-Pod-Spell>=0:textproc/p5-Pod-Spell \
		p5-IPC-Run3>=0:devel/p5-IPC-Run3

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
