PORTNAME=	Test-CleanNamespaces
PORTVERSION=	0.24
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check for uncleaned imports
WWW=		https://metacpan.org/release/Test-CleanNamespaces

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Module-Runtime>0:devel/p5-Module-Runtime \
		p5-Package-Stash>=0.14:devel/p5-Package-Stash \
		p5-Sub-Identify>0:devel/p5-Sub-Identify
TEST_DEPENDS=	p5-File-pushd>0:devel/p5-File-pushd \
		p5-Test-Deep>0:devel/p5-Test-Deep \
		p5-Test-Needs>0:devel/p5-Test-Needs \
		p5-Test-Warnings>=0.009:devel/p5-Test-Warnings \
		p5-namespace-clean>0:devel/p5-namespace-clean

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

PLIST_FILES=	${SITE_PERL_REL}/Test/CleanNamespaces.pm \
		${SITE_MAN3_REL}/Test::CleanNamespaces.3.gz

# hack for 3.1
post-fake:
	-${MKDIR} ${FAKE_DESTDIR}${PREFIX}/${SITE_MAN3_REL}
	-${CP} ${FAKE_DESTDIR}${PREFIX}/man/man3/Test::CleanNamespaces.3 ${FAKE_DESTDIR}${PREFIX}/${SITE_MAN3_REL}/Test::CleanNamespaces.3


.include <bsd.port.mk>
