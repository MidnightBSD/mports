PORTNAME=	MaxMind-DB-Common
PORTVERSION=	0.040001
PORTREVISION=	1
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAXMIND
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code shared by the DB reader and writer modules
WWW=		https://metacpan.org/release/MaxMind-DB-Common

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Data-Dumper-Concise>=0:devel/p5-Data-Dumper-Concise \
		p5-DateTime>=0:devel/p5-DateTime \
		p5-List-AllUtils>=0:devel/p5-List-AllUtils \
		p5-Moo>=0:devel/p5-Moo \
		p5-MooX-StrictConstructor>=0:devel/p5-MooX-StrictConstructor \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
