PORTNAME=	XML-SAX-Writer
PORTVERSION=	0.57
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SAX2 XML Writer
WWW=		https://metacpan.org/release/XML-SAX-Writer

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XML-Filter-BufferText>=1.00:textproc/p5-XML-Filter-BufferText \
		p5-XML-NamespaceSupport>=1.00:textproc/p5-XML-NamespaceSupport \
		p5-XML-SAX-Base>=1.01:textproc/p5-XML-SAX-Base

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
