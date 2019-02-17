# $MidnightBSD$

PORTNAME=	namespace-clean
PORTVERSION=	0.27
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keep imports and functions out of your namespace

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-B-Hooks-EndOfScope>=0.12:devel/p5-B-Hooks-EndOfScope \
		p5-Package-Stash>=0.23:devel/p5-Package-Stash

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes
NO_ARCH=	yes

.include <bsd.port.mk>
