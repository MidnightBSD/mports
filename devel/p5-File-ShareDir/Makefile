PORTNAME=	File-ShareDir
PORTVERSION=	1.118
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locate per-dist and per-module shared files
WWW=		https://metacpan.org/release/File-ShareDir

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Inspector>=1.12:devel/p5-Class-Inspector

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
