# $MidnightBSD: mports/textproc/ruby-deplate/Makefile,v 1.1 2009/08/26 22:17:49 laffer1 Exp $

PORTNAME=	deplate
PORTVERSION=	0.8.5
CATEGORIES=	textproc ruby
MASTER_SITES=	SF
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby tool for converting wiki-like markup
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

FAKE_OPTS=	prefixhack

USE_ZIP=	yes
USE_RUBY=	yes
USE_RUBY_SETUP=	yes

MAN1=		deplate.1

.include <bsd.port.mk>
