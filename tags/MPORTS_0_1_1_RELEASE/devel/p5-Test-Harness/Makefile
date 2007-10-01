# New ports collection makefile for:	p5-Test-Harness
# Date Created:				13 Aug 2001
# Whom:					Shell Hung <shell@shellhung.org>
#
# $FreeBSD: ports/devel/p5-Test-Harness/Makefile,v 1.25 2006/06/10 19:11:14 erwin Exp $
# $MidnightBSD: mports/devel/p5-Test-Harness/Makefile,v 1.2 2007/07/22 08:54:42 laffer1 Exp $
#

PORTNAME=	Test-Harness
PORTVERSION=	2.64
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run perl standard test scripts with statistics
LICENSE=	perl

PERL_CONFIGURE=	yes
INSTALL_TARGET=	pure_install

MAN3=		Test::Harness.3 Test::Harness::Assert.3 \
		Test::Harness::Iterator.3 Test::Harness::Point.3 \
		Test::Harness::Straps.3 Test::Harness::TAP.3 \
		Test::Harness::Util.3

post-patch:
	@${REINPLACE_CMD} -e '/INSTALLDIRS/d' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
