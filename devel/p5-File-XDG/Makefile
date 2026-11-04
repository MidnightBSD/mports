PORTNAME=	File-XDG
PORTVERSION=	1.03
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PLICEASE
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic implementation of the XDG base directory specification
WWW=		https://metacpan.org/release/File-XDG

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Path-Tiny>=0:devel/p5-Path-Tiny \
		p5-Ref-Util>=0:devel/p5-Ref-Util
TEST_DEPENDS=	p5-Path-Class>=0:devel/p5-Path-Class

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
