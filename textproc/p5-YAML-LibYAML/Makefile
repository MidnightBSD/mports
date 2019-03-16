# $MidnightBSD$

PORTNAME=	YAML-LibYAML
DISTVERSION=	0.72
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl YAML Serialization using XS and libyaml

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Filter>=0:devel/p5-Filter \
		p5-Test-Base>=0:devel/p5-Test-Base

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/YAML/XS/LibYAML/LibYAML.so

.include <bsd.port.mk>
