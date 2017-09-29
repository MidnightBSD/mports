# $MidnightBSD$

PORTNAME=	XML-Simple
PORTVERSION=	2.20
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Trivial API for reading and writing XML (esp config files)

LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
    		${SITE_PERL}/XML/SAX/Expat.pm:${PORTSDIR}/textproc/p5-XML-SAX-Expat
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

.include <bsd.port.mk>
