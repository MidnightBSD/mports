# Created by: Lars Thegler <lth@FreeBSD.org>

PORTNAME=	Test-YAML-Valid
PORTVERSION=	0.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test for valid YAML

LICENSE=	artistic

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-YAML>=0.60:textproc/p5-YAML

USES=		perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	YAMLSYCK
YAMLSYCK_DESC=	Use YAML::Syck for testing

YAMLSYCK_RUN_DEPENDS=	p5-YAML-Syck>0:textproc/p5-YAML-Syck
YAMLSYCK_BUILD_DEPENDS=	p5-YAML-Syck>0:textproc/p5-YAML-Syck

post-patch:
	@${REINPLACE_CMD} -i '' -e '/auto_install.*/d' \
		${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
