PORTNAME=	List-Compare
PORTVERSION=	0.55
CATEGORIES=	misc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for comparing lists
WWW=		https://metacpan.org/release/List-Compare

LICENSE=	artistic

TEST_DEPENDS=	p5-IO-CaptureOutput>=0:devel/p5-IO-CaptureOutput

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

PORTDOCS=	Changes README

.include <bsd.mport.options.mk>

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
