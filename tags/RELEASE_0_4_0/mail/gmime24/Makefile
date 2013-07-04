# $MidnightBSD$
# $FreeBSD: ports/mail/gmime24/Makefile,v 1.11 2011/08/11 19:19:39 kwm Exp $

PORTNAME=	gmime
PORTVERSION=	2.4.24
PORTREVISION?=	0
CATEGORIES?=	mail
MASTER_SITES=	GNOME
PKGNAMESUFFIX?=	-24

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library (written in C) for parsing and creating messages using MIME
LICENSE=	lgpl2.1

CONFLICTS=	gmime-1.0.*

SLAVEDIRS=	mail/gmime2-sharp

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}24
USE_ICONV=	yes
USE_GMAKE=	yes
USE_GNOME?=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?=--with-html-dir=${PREFIX}/share/doc \
		--enable-mono=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib"

LATEST_LINK?=	${PORTNAME}24

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/
.for i in docs/reference/html/*
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
