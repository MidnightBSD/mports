# New ports collection makefile for:	p5-Set-IntSpan
# Date created:		February 7, 1998
# Whom:			Don Croyle <croyle@gelemna.org>
#
# $MidnightBSD: mports/math/p5-Set-IntSpan/Makefile,v 1.1 2007/05/08 21:32:10 laffer1 Exp $
# $FreeBSD: ports/math/p5-Set-IntSpan/Makefile,v 1.12 2006/01/01 19:06:39 leeym Exp $
#

PORTNAME=	Set-IntSpan
PORTVERSION=	1.13
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manages sets of integers
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Set::IntSpan.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
post-patch:
	${PERL} -pi -e 's/^our (\S+)/use vars qw($$1); $$1/' ${WRKSRC}/IntSpan.pm
.endif

.include <bsd.port.post.mk>
