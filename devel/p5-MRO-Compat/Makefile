# $FreeBSD: ports/devel/p5-MRO-Compat/Makefile,v 1.2 2007/07/20 07:26:00 lbr Exp $
# $MidnightBSD$

PORTNAME=	MRO-Compat
PORTVERSION=	0.13
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/F/FL/FLORA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Add mro::* interface compatibility for Perls < 5.9.5

LICENSE=	perl

BUILD_DEPENDS=	p5-Class-C3>=0.19:${PORTSDIR}/devel/p5-Class-C3
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

post-extract:
	@${PERL} -i.bak -ne 'print unless m,^if, .. m,}$$,' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
