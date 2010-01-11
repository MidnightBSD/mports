# $MidnightBSD: mports/textproc/ruby-deplate/Makefile,v 1.2 2009/11/10 03:13:12 laffer1 Exp $

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

HAS_CONFIGURE=	yes
CONFIGURE_ARGS+=--prefix=${FAKE_DESTDIR}${TRUE_PREFIX} \
		--mandir=${FAKE_DESTDIR}${TRUE_PREFIX}/man \
		--bindir=${FAKE_DESTDIR}${TRUE_PREFIX}/bin \
		--libdir=${FAKE_DESTDIR}${TRUE_PREFIX}/lib
USE_ZIP=	yes
USE_RUBY=	yes
USE_RUBY_SETUP=	yes

MAN1=		deplate.1

.include <bsd.port.mk>
