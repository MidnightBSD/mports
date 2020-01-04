PORTNAME=	Time-Local
PORTVERSION=	1.28
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficiently compute time from local and GMT time

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=	DOCS

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

PORTDOCS=	Changes

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
