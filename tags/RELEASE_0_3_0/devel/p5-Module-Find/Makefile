# New ports collection makefile for:	Module-Find
# Date created:	   26 Sep 2005
# Whom:		   Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD: ports/devel/p5-Module-Find/Makefile,v 1.3 2006/05/01 13:51:47 lbr Exp $
# $MidnightBSD: mports/devel/p5-Module-Find/Makefile,v 1.1 2007/09/01 17:07:49 ctriv Exp $
#

PORTNAME=	Module-Find
PORTVERSION=	0.06
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Module
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Lets you find and use modules in categories
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple \
		${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Module::Find.3

.include <bsd.port.mk>

