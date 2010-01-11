# $MidnightBSD: mports/textproc/ruby-deplate/Makefile,v 1.3 2010/01/11 00:54:33 laffer1 Exp $

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
		--libdir=${FAKE_DESTDIR}${TRUE_PREFIX}/lib \
		--siterubyver=${FAKE_DESTDIR}${RUBY_SITELIBDIR}
USE_ZIP=	yes
USE_RUBY=	yes
USE_RUBY_SETUP=	yes

MAN1=		deplate.1

.include <bsd.port.mk>
