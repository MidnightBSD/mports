# $MidnightBSD$
# $FreeBSD: ports/devel/libexecinfo/Makefile,v 1.7 2006/06/29 13:21:47 itetcu Exp $

PORTNAME=	libexecinfo
PORTVERSION=	1.1
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/itetcu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for inspecting program's backtrace

LICENSE=	bsd2

OPTIONS_DEFINE=	DOCS

USES=		tar:bzip2 uidfix
USE_LDCONFIG=	yes
CFLAGS=		-fno-omit-frame-pointer
FAKE_MAKEARGS=	LIBDIR=${PREFIX}/lib \
		INCLUDEDIR=${PREFIX}/include

PORTDOCS=	README

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=      -fno-omit-frame-pointer
.endif

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}

.include <bsd.port.post.mk>
