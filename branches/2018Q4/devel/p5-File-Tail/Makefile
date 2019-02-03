# $FreeBSD: ports/devel/p5-File-Tail/Makefile,v 1.11 2006/06/19 20:06:51 shaun Exp $
# $MidnightBSD$

PORTNAME=	File-Tail
PORTVERSION=	0.99.3
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	File
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl Module to read the end of a file as it\'s appended to
LICENSE=	perl

PERL_CONFIGURE=	YES

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500800
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Time/HiRes.pm:${PORTSDIR}/devel/p5-Time-HiRes
RUN_DEPENDS=	${BUILD_DEPENDS}
.endif

.include <bsd.port.post.mk>
