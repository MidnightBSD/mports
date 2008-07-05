# New ports collection makefile for:	p5-Config-General
# Date created:				August 27 2002
# Whom:	      				Sheldon Hearn <sheldonh@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Config-General/Makefile,v 1.1 2007/05/08 21:51:27 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Config-General/Makefile,v 1.16 2007/02/25 07:55:16 rafan Exp $
#

PORTNAME=	Config-General
PORTVERSION=	2.39
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Config
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for handling Apache-style configuration files
LICENSE=        perl
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Config::General::Extended.3 Config::General::Interpolated.3 \
		Config::General.3

.include <bsd.port.mk>
