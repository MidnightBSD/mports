PORTNAME=	DateTime-Calendar-Japanese-Era
PORTVERSION=	0.08001
PORTREVISION=	2
CATEGORIES=	japanese devel perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DateTime Extension for Japanese Eras
WWW=		https://metacpan.org/release/DateTime-Calendar-Japanese-Era

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Accessor>=0:devel/p5-Class-Accessor \
		p5-Class-Data-Inheritable>=0:devel/p5-Class-Data-Inheritable \
		p5-Module-Install>=0.91:devel/p5-Module-Install \
		p5-DateTime>=0:devel/p5-DateTime \
		p5-File-ShareDir>=0:devel/p5-File-ShareDir \
		p5-Params-Validate>=0:devel/p5-Params-Validate \
		p5-YAML-Tiny>=1.38:textproc/p5-YAML-Tiny
#TEST_DEPENDS=	p5-YAML>=0:textproc/p5-YAML

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-patch:
	@${RM} -r ${WRKSRC}/inc

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
