# New ports collection makefile for:    notebook
# Date created:         3 Dec 2007
# Whom:                 luke@midnightbsd.org
#
# $MidnightBSD$
# $FreeBSD: ports/deskutils/gnustep-notebook/Makefile,v 1.5 2007/05/19 20:01:36 flz Exp $
#

PORTNAME=	notebook
PORTVERSION=	0.3
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://notebook.cowgar.com/NoteBook/releases/ \
		http://io.debian.net/~tar/debian/notebook/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	NoteBook-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Place to store notes in an organized manner

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/NoteBook.app/NoteBook

.include <bsd.port.mk>
