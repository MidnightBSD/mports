# Created by: ijliao

PORTNAME=	PDF-API2
PORTVERSION=	2.037
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Facilitates the creation and modification of PDF files

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Font-TTF>=0:x11-fonts/p5-Font-TTF
TEST_DEPENDS=	p5-Test-Exception>=0:devel/p5-Test-Exception \
		p5-Test-Memory-Cycle>=0:devel/p5-Test-Memory-Cycle

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
