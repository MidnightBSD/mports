PORTNAME=	Perl-MinimumVersion
PORTVERSION=	1.40
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find a minimum required version of perl for Perl code
WWW=		https://metacpan.org/release/Perl-MinimumVersion

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-File-Find-Rule>=0:devel/p5-File-Find-Rule \
		p5-File-Find-Rule-Perl>=0:devel/p5-File-Find-Rule-Perl \
		p5-PPI>=1.215:textproc/p5-PPI \
		p5-PPIx-Regexp>=0.033:textproc/p5-PPIx-Regexp \
		p5-PPIx-Utils>=0:textproc/p5-PPIx-Utils \
		p5-Params-Util>=0.25:devel/p5-Params-Util
TEST_DEPENDS=	p5-Test-Script>=0:devel/p5-Test-Script

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
