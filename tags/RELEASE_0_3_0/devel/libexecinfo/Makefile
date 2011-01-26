# New ports collection makefile for:	libexecinfo
# Date created:				10 August 2003
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libexecinfo/Makefile,v 1.3 2009/04/05 19:52:34 laffer1 Exp $
# $FreeBSD: ports/devel/libexecinfo/Makefile,v 1.7 2006/06/29 13:21:47 itetcu Exp $
#

PORTNAME=	libexecinfo
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	itetcu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for inspecting program's backtrace
LICENSE=	bsd2

USE_BZIP2=	yes
USE_LDCONFIG=	yes
FAKE_MAKEARGS=	LIBDIR=${FAKE_DESTDIR}${PREFIX}/lib \
		INCLUDEDIR=${FAKE_DESTDIR}${PREFIX}/include

PORTDOCS=	README

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=      -fno-omit-frame-pointer
.endif

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
