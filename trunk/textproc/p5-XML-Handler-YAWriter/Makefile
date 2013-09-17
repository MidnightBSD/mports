# $MidnightBSD$

PORTNAME=	XML-Handler-YAWriter
PORTVERSION=	0.23
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another Perl SAX XML Writer
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/XML/Parser/PerlSAX.pm:${PORTSDIR}/textproc/p5-libxml
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=		xmlpretty.1
MAN3=		XML::Handler::YAWriter.3

.include <bsd.port.mk>
