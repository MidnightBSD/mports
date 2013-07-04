# New ports collection makefile for:	p5-Class-Adapter
# Date created:		2006-08-13
# Whom:			Tsung-Han Yeh <snowfly@yuntech.edu.tw>
#
# $MidnightBSD: mports/devel/p5-Class-Adapter/Makefile,v 1.1 2008/08/17 22:33:48 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Class-Adapter/Makefile,v 1.4 2008/02/20 13:24:37 miwi Exp $
#

PORTNAME=	Class-Adapter
PORTVERSION=	1.07
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl implementation of the "Adapter" Design Pattern
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Scalar/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils \
		${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Scalar/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils \
		${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple

PERL_CONFIGURE=	yes

MAN3=		Class::Adapter.3 \
		Class::Adapter::Builder.3 \
		Class::Adapter::Clear.3

.include <bsd.port.mk>
