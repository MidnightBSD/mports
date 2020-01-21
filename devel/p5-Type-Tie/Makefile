PORTNAME=	Type-Tie
PORTVERSION=	0.014
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TOBYINK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tie a variable to a type constraint

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Exporter-Tiny>=0.026:devel/p5-Exporter-Tiny \
		p5-Hash-FieldHash>=0:devel/p5-Hash-FieldHash

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes
# circular depends on tests prevent testing this port

.include <bsd.port.mk>
