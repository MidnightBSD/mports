PORTNAME=	Test-XML-Valid
PORTVERSION=	0.04
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidngihtBSD.org
COMMENT=	Validate XML and XHTML
WWW=		https://metacpan.org/release/Test-XML-Valid

LICENSE=	other

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XML-LibXML>0:textproc/p5-XML-LibXML \
		p5-Test-Simple>0:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	modbuild

NO_TEST=	yes

.include <bsd.port.mk>
