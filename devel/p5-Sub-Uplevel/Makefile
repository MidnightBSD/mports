# New ports collection makefile for:    p5-Sub-Uplevel
# Date created:				January 27th 2003
# Whom:	      				Erwin Lansing <erwin@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Sub-Uplevel/Makefile,v 1.1 2008/03/21 19:54:55 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Sub-Uplevel/Makefile,v 1.15 2008/02/18 15:48:28 erwin Exp $
#

PORTNAME=	Sub-Uplevel
PORTVERSION=	0.1901
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sub::Uplevel - apparently run a function in a higher stack frame
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple \
		${SITE_PERL}/Test/Perl/Critic.pm:${PORTSDIR}/textproc/p5-Test-Perl-Critic \
		${SITE_PERL}/Pod/Coverage.pm:${PORTSDIR}/devel/p5-Pod-Coverage \
		${SITE_PERL}/Test/Pod/Coverage.pm:${PORTSDIR}/devel/p5-Test-Pod-Coverage \
		${SITE_PERL}/Test/Pod.pm:${PORTSDIR}/devel/p5-Test-Pod
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Sub::Uplevel.3

.include <bsd.port.mk>
