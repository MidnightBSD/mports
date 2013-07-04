# New ports collection makefile for:	XML::SAX
# Date created:		19 Nov 2001
# Whom:			Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD: mports/textproc/p5-XML-SAX/Makefile,v 1.1 2007/03/11 04:42:46 laffer1 Exp $
# $FreeBSD: ports/textproc/p5-XML-SAX/Makefile,v 1.10 2006/06/25 16:38:44 clsung Exp $
#

PORTNAME=	XML-SAX
PORTVERSION=	0.16
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple API for XML
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/XML/NamespaceSupport.pm:${PORTSDIR}/textproc/p5-XML-NamespaceSupport
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS= </dev/null

PLIST_SUB+=	PERL=${PERL}

MAN3=		XML::SAX.3 XML::SAX::Base.3 XML::SAX::DocumentLocator.3 \
		XML::SAX::Exception.3 XML::SAX::Intro.3 \
		XML::SAX::ParserFactory.3 XML::SAX::PurePerl.3 \
		XML::SAX::PurePerl::Reader.3

post-configure:
# dirty hack to deceive irritable pod2man
		@${PERL} -pi -e 's/^(POD2MAN_EXE.*)$$/\1 --lax/;' \
				${WRKSRC}/Makefile

.include <bsd.port.mk>

