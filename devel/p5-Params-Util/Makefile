# New ports collection makefile for:	devel/p5-Params-Util
# Date created:				4 July 2005
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Params-Util/Makefile,v 1.1 2008/03/21 20:39:51 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Params-Util/Makefile,v 1.19 2007/12/16 04:52:57 chinsan Exp $
#

PORTNAME=	Params-Util
PORTVERSION=	0.33
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility functions to aid in parameter checking
LICENSE=        gpl2     
PERL_CONFIGURE=	yes

MAN3=	Params::Util.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500805
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Scalar/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils
.endif

.include <bsd.port.post.mk>
