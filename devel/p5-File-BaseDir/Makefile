PORTNAME=	File-BaseDir
PORTVERSION=	0.09
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use the freedesktop basedir spec
WWW=		https://metacpan.org/release/File-BaseDir

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-IPC-System-Simple>=0:devel/p5-IPC-System-Simple
TEST_DEPENDS=	p5-File-Which>=0:sysutils/p5-File-Which  \
		p5-Test-Pod>=1.00:devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=1.00:devel/p5-Test-Pod-Coverage

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
