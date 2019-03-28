PORTNAME=	Set-Object
PORTVERSION=	1.39
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to manage sets of objects

LICENSE=	artistic2

TEST_DEPENDS=	p5-Moose>=0:devel/p5-Moose \
		p5-Test-LeakTrace>=0:devel/p5-Test-LeakTrace

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Set/Object/Object.so

.include <bsd.port.mk>
