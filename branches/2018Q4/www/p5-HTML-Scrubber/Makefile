# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTML-Scrubber/Makefile,v 1.3 2004/05/28 02:10:57 foxfair Exp $

PORTNAME=	HTML-Scrubber
PORTVERSION=	0.15
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for scrubbing/sanitizing html

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/${PERL_ARCH}/HTML/Parser.pm:${PORTSDIR}/www/p5-HTML-Parser

USE_PERL5=	yes
PERL_MODBUILD=	yes

.include <bsd.port.mk>
