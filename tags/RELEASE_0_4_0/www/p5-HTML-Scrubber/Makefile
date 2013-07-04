# New ports collection makefile for:    p5-HTML-Scrubber
# Date created:				31 Oct 2003
# Whom:					Foxfair Hu <foxfair@FreeBSD.org>
#
# $MidnightBSD: mports/www/p5-HTML-Scrubber/Makefile,v 1.2 2008/10/08 04:40:44 laffer1 Exp $
# $FreeBSD: ports/www/p5-HTML-Scrubber/Makefile,v 1.3 2004/05/28 02:10:57 foxfair Exp $
#

PORTNAME=	HTML-Scrubber
PORTVERSION=	0.08
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for scrubbing/sanitizing html
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/${PERL_ARCH}/HTML/Parser.pm:${PORTSDIR}/www/p5-HTML-Parser

MAKE_JOBS_SAFE=	yes
PERL_CONFIGURE=	yes

MAN3=		HTML::Scrubber.3

.include <bsd.port.mk>
