# New ports collection makefile for:	p5-libxml
# Date created:		13 March 2001
# Whom:	      		Johann Visagie <johann@egenetics.com>
#
# $MidnightBSD: mports/textproc/p5-libxml/Makefile,v 1.2 2008/08/25 19:12:30 laffer1 Exp $
# $FreeBSD: ports/textproc/p5-libxml/Makefile,v 1.7 2005/01/21 09:27:22 tobez Exp $
#

PORTNAME=	libxml
PORTVERSION=	0.08
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN/XML
PKGNAMEPREFIX=	p5-
DISTNAME=	libxml-perl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of Perl5 modules for working with XML
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Data::Grove.3 Data::Grove::Parent.3 Data::Grove::Visitor.3 \
		XML::ESISParser.3 XML::Handler::CanonXMLWriter.3 \
		XML::Handler::Sample.3 XML::Handler::Subs.3 \
		XML::Handler::XMLWriter.3 XML::Parser::PerlSAX.3 \
		XML::PatAct::ActionTempl.3 XML::PatAct::Amsterdam.3 \
		XML::PatAct::MatchName.3 XML::PatAct::PatternTempl.3 \
		XML::PatAct::ToObjects.3 XML::Perl2SAX.3 XML::SAX2Perl.3


.include <bsd.port.mk>
