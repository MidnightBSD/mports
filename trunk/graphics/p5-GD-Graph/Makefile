# New ports collection makefile for:	p5-GD-Graph
# Date created:				21 February 2000
# Whom:	      				Dmitry Sivachenko <dima@Chg.RU>
#
# $MidnightBSD: mports/graphics/p5-GD-Graph/Makefile,v 1.1 2007/03/11 05:35:04 laffer1 Exp $
# $FreeBSD: ports/graphics/p5-GD-Graph/Makefile,v 1.17 2006/06/14 11:24:32 mat Exp $
#

PORTNAME=	GD-Graph
PORTVERSION=	1.43.08
CATEGORIES=	graphics perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Test/BWARFIELD
PKGNAMEPREFIX=	p5-
DISTNAME=	GDGraph-${PORTVERSION:C/\.(..)$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph plotting module for perl5
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/GD.pm:${PORTSDIR}/graphics/p5-GD \
		${SITE_PERL}/GD/Text/Align.pm:${PORTSDIR}/graphics/p5-GD-TextUtil
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		GD::Graph.3 \
		GD::Graph::Data.3 \
		GD::Graph::Error.3 \
		GD::Graph::FAQ.3 \
		GD::Graph::colour.3 \
		GD::Graph::hbars.3

post-patch:
	@${FIND} ${WRKSRC} -name "*.orig" -print0 | ${XARGS} -0 ${RM} -f

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500800
IGNORE=		requires perl 5.8.x or later. Install lang/perl5.8 then try again
.endif

.include <bsd.port.post.mk>
