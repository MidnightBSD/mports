PORTNAME=	PPIx-QuoteLike
PORTVERSION=	0.023
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:WYANT
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse Perl string literals and string-literal-like things
WWW=		https://metacpan.org/release/PPIx-QuoteLike

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/LICENSES/Artistic
LICENSE_FILE_gpl=	${WRKSRC}/LICENSES/Copying

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-PPI>=1.238:textproc/p5-PPI \
		p5-Readonly>=0:devel/p5-Readonly

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

.include <bsd.port.mk>
