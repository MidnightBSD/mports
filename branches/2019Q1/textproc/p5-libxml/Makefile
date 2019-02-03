# New ports collection makefile for:	p5-libxml
# Date created:		13 March 2001
# Whom:	      		Johann Visagie <johann@egenetics.com>
#
# $MidnightBSD$
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

.include <bsd.port.mk>
