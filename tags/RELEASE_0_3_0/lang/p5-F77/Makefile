# $MidnightBSD: mports/lang/p5-F77/Makefile,v 1.1 2006/10/31 19:57:03 laffer1 Exp $

PORTNAME=	ExtUtils-F77
PORTVERSION=	1.16
CATEGORIES=	lang perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps link C programs with Fortran subroutines
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		ExtUtils::F77.3

.include <bsd.port.pre.mk>
F2CLIB=	-lg2c

post-patch:
	@cd ${WRKSRC}; ${PERL5} -i.orig -pe \
		's/(.*Freebsd.*lib )(-lf2c)(.*)/$$1 ${F2CLIB} $$3/' F77.pm

.include <bsd.port.post.mk>
