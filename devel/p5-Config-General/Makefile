# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Config-General/Makefile,v 1.16 2007/02/25 07:55:16 rafan Exp $

PORTNAME=	Config-General
PORTVERSION=	2.63
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for handling Apache-style configuration files

LICENSE=        perl

PERL_CONFIGURE=	YES

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
BUILD_DEPENDS+=  ${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools
RUN_DEPENDS+=    ${BUILD_DEPENDS}
.endif

.include <bsd.port.post.mk>
