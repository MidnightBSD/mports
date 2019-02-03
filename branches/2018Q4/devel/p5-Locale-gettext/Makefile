# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Locale-gettext/Makefile,v 1.18 2005/12/07 17:05:21 demon Exp $

PORTNAME=	Locale-gettext
PORTVERSION=	1.06
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME:C/.*-//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Message handling functions

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		gettext perl5
PERL_CONFIGURE=	yes
CONFIGURE_ENV+=	LOCALBASE=${LOCALBASE}

.include <bsd.port.mk>
