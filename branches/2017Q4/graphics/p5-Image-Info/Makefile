# $MidnightBSD$
# $FreeBSD: ports/graphics/p5-Image-Info/Makefile,v 1.13 2006/12/03 12:45:57 demon Exp $

PORTNAME=	Image-Info
PORTVERSION=	1.41
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for getting image information

LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String \
		${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple \
		p5-XML-LibXML>0:${PORTSDIR}/textproc/p5-XML-LibXML
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
