# New ports collection makefile for:	p5-AppConfig
# Date created:				23 October 1999
# Whom:					Igor Vinokurov <igor@zynaps.ru>
#
# $MidnightBSD: mports/devel/p5-AppConfig/Makefile,v 1.1 2007/03/11 03:54:38 laffer1 Exp $
# $FreeBSD: ports/devel/p5-AppConfig/Makefile,v 1.10 2007/01/07 20:45:26 lth Exp $
#

PORTNAME=	AppConfig
PORTVERSION=	1.66
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Perl module for reading configuration files
LICENSE=	perl

RUN_DEPENDS=	p5-File-HomeDir>=0.61:${PORTSDIR}/devel/p5-File-HomeDir
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		AppConfig.3 \
		AppConfig::Args.3 \
		AppConfig::CGI.3 \
		AppConfig::File.3 \
		AppConfig::Getopt.3 \
		AppConfig::State.3 \
		AppConfig::Sys.3

.include <bsd.port.mk>
