PORTNAME=	Capture-Tiny
PORTVERSION=	0.50
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DAGOLDEN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Capture STDOUT and STDERR from Perl, XS, or external programs
WWW=		https://metacpan.org/release/Capture-Tiny

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Inline>=0.50:devel/p5-Inline

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
