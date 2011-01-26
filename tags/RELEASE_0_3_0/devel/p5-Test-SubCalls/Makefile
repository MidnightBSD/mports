# New ports collection makefile for:	devel/p5-Test-SubCalls
# Date created:				08 October 2005
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Test-SubCalls/Makefile,v 1.1 2008/03/21 20:39:51 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Test-SubCalls/Makefile,v 1.9 2007/12/17 17:33:06 lth Exp $
#

PORTNAME=	Test-SubCalls
PORTVERSION=	1.07
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Track the number of times subs are called
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Hook/LexWrap.pm:${PORTSDIR}/devel/p5-Hook-LexWrap \
		${SITE_PERL}/Test/Builder/Tester.pm:${PORTSDIR}/devel/p5-Test-Simple
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Test::SubCalls.3

post-patch:
	@${PERL} -pi -e '$$_="" if m/Test::More/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
