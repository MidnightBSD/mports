PORTNAME=	Config-Auto
PORTVERSION=	0.44
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BINGOS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Magical config file parser
WWW=		https://metacpan.org/release/Config-Auto

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Config-IniFiles>=0:devel/p5-Config-IniFiles \
		p5-YAML>=0.67:textproc/p5-YAML
TEST_DEPENDS=	p5-IO-String>=0:devel/p5-IO-String

USES=		perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	XMLSIMPLE
XMLSIMPLE_DESC=	Support for XML config files

XMLSIMPLE_BUILD_DEPENDS=	p5-XML-Simple>=0:textproc/p5-XML-Simple
XMLSIMPLE_RUN_DEPENDS=	p5-XML-Simple>=0:textproc/p5-XML-Simple

.include <bsd.port.mk>
