PORTNAME=	GraphViz
PORTVERSION=	2.25
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GraphViz - Perl interface to the GraphViz graphing tool
WWW=		https://metacpan.org/release/GraphViz

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS} \
		p5-File-Which>=1.09:sysutils/p5-File-Which
RUN_DEPENDS=	dot:graphics/graphviz \
		p5-IPC-Run>=0.60:devel/p5-IPC-Run \
		p5-Parse-RecDescent>=1.96:devel/p5-Parse-RecDescent \
		p5-XML-Twig>=3.52:textproc/p5-XML-Twig
TEST_DEPENDS=	p5-Test-Simple>=1.302200:devel/p5-Test-Simple

USES=		cpe perl5 tar:tgz
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
