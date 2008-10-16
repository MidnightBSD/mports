# New ports collection makefile for:	Spiffy
# Date created:		15 Jul 2004
# Whom:			Elvis Chiang <elvis@sslab.cs.ccu.edu.tw>
#
# $MidnightBSD: mports/devel/p5-Spiffy/Makefile,v 1.1 2007/03/11 05:15:10 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Spiffy/Makefile,v 1.13 2006/01/30 07:29:30 clsung Exp $
#

PORTNAME=	Spiffy
PORTVERSION=	0.30
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../../authors/id/I/IN/INGY/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spiffy Perl Interface Framework For You
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Spiffy.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
