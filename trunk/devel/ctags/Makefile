# New ports collection makefile for:   Exuberant Ctags
# Date created:        4 June 1996
# Whom:                jkoshy
#
# $FreeBSD: ports/devel/ctags/Makefile,v 1.35 2008/04/10 09:12:53 jkoshy Exp $
#

PORTNAME=	ctags
PORTVERSION=	5.7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A feature-filled tagfile generator for vi and emacs clones
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-macro-patterns --with-readlib

MAN1=		exctags.1

FAKE_OPTS=	prefixhack

.include <bsd.port.mk>
