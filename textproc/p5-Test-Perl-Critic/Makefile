# New ports collection makefile for:	p5-Test-Perl-Critic
# Date created:				2007/06/07
# Whom:					chinsan
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-Test-Perl-Critic/Makefile,v 1.1 2007/07/28 11:47:09 chinsan Exp $
#

PORTNAME=	Test-Perl-Critic
PORTVERSION=	1.02
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use Perl::Critic in test programs
LICENSE=	perl

BUILD_DEPENDS=	p5-Perl-Critic>=0:${PORTSDIR}/textproc/p5-Perl-Critic
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Test::Perl::Critic.3

.include <bsd.port.mk>
