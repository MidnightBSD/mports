# $MidnightBSD$
#

PORTNAME=	XML-SAX
PORTVERSION=	0.99
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple API for XML

LICENSE=	perl

BUILD_DEPENDS=	p5-XML-NamespaceSupport>=0.03:${PORTSDIR}/textproc/p5-XML-NamespaceSupport \
		p5-XML-SAX-Base>=1.05:${PORTSDIR}/textproc/p5-XML-SAX-Base
RUN_DEPENDS=	p5-XML-NamespaceSupport>=0.03:${PORTSDIR}/textproc/p5-XML-NamespaceSupport \
		p5-XML-SAX-Base>=1.05:${PORTSDIR}/textproc/p5-XML-SAX-Base

PERL_CONFIGURE=	yes

MAN3=		XML::SAX.3 XML::SAX::DocumentLocator.3 XML::SAX::Intro.3 \
		XML::SAX::ParserFactory.3 XML::SAX::PurePerl.3 \
		XML::SAX::PurePerl::Reader.3
CONFIGURE_ARGS= </dev/null

post-configure:
# dirty hack to deceive irritable pod2man
		@${PERL} -pi -e 's/^(POD2MAN_EXE.*)$$/\1 --lax/;' \
				${WRKSRC}/Makefile

.include <bsd.port.mk>

