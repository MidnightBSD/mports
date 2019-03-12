# $MidnightBSD$

PORTNAME=	XML-XPath
PORTVERSION=	1.13
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules for parsing and evaluating XPath statements

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:textproc/p5-XML-Parser
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
