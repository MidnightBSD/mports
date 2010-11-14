# New ports collection makefile for:	Class-C3-Componentised
# Date created:	   13 Aug 2007
# Whom:		   Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD: ports/devel/p5-Class-C3-Componentised/Makefile,v 1.1 2007/08/12 22:13:41 lbr Exp $
# $MidnightBSD: mports/devel/p5-Class-C3-Componentised/Makefile,v 1.1 2007/09/01 17:05:16 ctriv Exp $
#

PORTNAME=	Class-C3-Componentised
PORTVERSION=	1.0006
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Load mix-ins or components to your C3-based class
LICENSE=	perl

RUN_DEPENDS=	p5-Class-C3>=0:${PORTSDIR}/devel/p5-Class-C3 \
		p5-Class-Inspector>=0:${PORTSDIR}/devel/p5-Class-Inspector
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Class::C3::Componentised.3

post-extract:
	@${PERL} -i.bak -ne 'print unless m,Test::,' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

