# New ports collection makefile for:	p5-gettext
# Date created:			1 February 2000
# Whom:				Dmitry Sivachenko <dima@Chg.RU>
#
# $MidnightBSD: mports/devel/p5-Locale-gettext/Makefile,v 1.1 2006/09/21 13:39:19 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Locale-gettext/Makefile,v 1.18 2005/12/07 17:05:21 demon Exp $
#

PORTNAME=	gettext
PORTVERSION=	1.05
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Locale
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Message handling functions
LICENSE=	perl

PERL_CONFIGURE=	yes
CONFIGURE_ENV+=	LOCALBASE=${LOCALBASE}
USE_GETTEXT=	yes

MAN3=		Locale::gettext.3

.include <bsd.port.mk>
