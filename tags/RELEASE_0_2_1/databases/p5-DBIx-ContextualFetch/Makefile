# New ports collection makefile for:	DBIx-ContextualFetch
# Date created:	   17 March 2004
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD: ports/databases/p5-DBIx-ContextualFetch/Makefile,v 1.5 2007/06/30 09:54:41 erwin Exp $
# $MidnightBSD$
#

PORTNAME=	DBIx-ContextualFetch
PORTVERSION=	1.03
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	DBIx/TMTM
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Add contextual fetches to DBI
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		DBIx::ContextualFetch.3

.include <bsd.port.mk>

