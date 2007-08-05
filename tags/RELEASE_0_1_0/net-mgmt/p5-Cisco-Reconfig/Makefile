# New ports collection makefile for:	p5-Cisco-Reconfig
# Date created:		2006-08-25
# Whom:			Gea-Suan Lin <gslin@gslin.org>
#
# $FreeBSD: ports/net-mgmt/p5-Cisco-Reconfig/Makefile,v 1.1 2006/09/28 07:05:59 clsung Exp $
# $MidnightBSD: mports/net-mgmt/p5-Cisco-Reconfig/Makefile,v 1.1 2006/12/26 00:58:13 laffer1 Exp $ 
#

PORTNAME=	Cisco-Reconfig
PORTVERSION=	0.8
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Cisco
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and generate Cisco configuration files
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Cisco::Reconfig.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500703
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Scalar/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils
.endif

.include <bsd.port.post.mk>
