# New ports collection makefile for:    p5-URI
# Date created:				1999/04/07
# Whom:					ache
#
# $FreeBSD: ports/net/p5-URI/Makefile,v 1.37 2004/11/30 16:09:07 tobez Exp $
# $MidnightBSD: mports/net/p5-URI/Makefile,v 1.2 2008/08/25 19:15:11 laffer1 Exp $
#

PORTNAME=	URI
PORTVERSION=	1.54
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to Uniform Resource Identifier (URI) references
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		URI.3 \
		URI::Escape.3 \
		URI::Heuristic.3 \
		URI::QueryParam.3 \
		URI::Split.3 \
		URI::URL.3 \
		URI::WithBase.3 \
		URI::data.3 \
		URI::file.3 \
		URI::ldap.3

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -pi -e 's/^our\s+([\$$\@\%]\w+)/use vars qw($$1);/' \
		${WRKSRC}/URI/urn.pm

.include <bsd.port.post.mk>
