PORTNAME=	DateTime-Set
PORTVERSION=	0.3900
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Datetime sets and set math
WWW=		https://metacpan.org/release/DateTime-Set

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0.12:devel/p5-DateTime \
		p5-Params-Validate>=0:devel/p5-Params-Validate \
		p5-Set-Infinite>=0.59:devel/p5-Set-Infinite

OPTIONS_DEFINE=	DOCS

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

PORTDOCS=	Changes README TODO

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
