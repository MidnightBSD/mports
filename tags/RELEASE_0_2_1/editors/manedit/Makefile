# New ports collection makefile for:	manedit
# Date created:				9 February 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/editors/manedit/Makefile,v 1.1 2006/10/04 23:55:40 laffer1 Exp $
# $FreeBSD: ports/editors/manedit/Makefile,v 1.20 2006/09/02 15:57:58 garga Exp $
#

PORTNAME=	manedit
PORTVERSION=	0.7.1
CATEGORIES=	editors
MASTER_SITES=	http://wolfpack.twu.net/users/wolfpack/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A UNIX manual page editor and viewer
LICENSE=        gpl2
WRKSRC=		${WRKDIR}/${DISTNAME}/${PORTNAME}

USE_BZIP2=	yes
USE_GNOME=	gtk12
MAKEFILE=	Makefile.FreeBSD

MAN1=		manedit.1

pre-configure:
	${CP} ${FILESDIR}/mntent* ${WRKSRC}

.include <bsd.port.mk>
