# New ports collection makefile for:	p5-Data-Dumper
# Date created:	   23 March 2003
# Whom:		   mat
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Data-Dumper/Makefile,v 1.2 2004/12/01 11:42:51 tobez Exp $
#

PORTNAME=	Data-Dumper
PORTVERSION=	2.121
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Data
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stringified perl data structures, suitable for both printing and eval

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500601
IGNORE="Need at least perl 5.6.1 to build"
.endif

.include <bsd.port.post.mk>
