# $MidnightBSD: mports/mail/gmime2/Makefile,v 1.5 2011/04/30 17:53:56 laffer1 Exp $

PORTNAME=	gmime
PORTVERSION=	2.2.24
PORTREVISION?=	0
CATEGORIES?=	mail
MASTER_SITES=	GNOME

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library (written in C) for parsing and creating messages using MIME
LICENSE=	lgpl

 CONFLICTS=    gmime-1.0.* gmime-2.4.

SLAVEDIRS=	mail/gmime2-sharp

USE_ICONV=	yes
USE_GMAKE=	yes
USE_GNOME?=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?=	--with-libiconv=${LOCALBASE} \
			--with-html-dir=${PREFIX}/share/doc \
			--enable-mono=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib"

LATEST_LINK?=	${PORTNAME}2

PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e "s|stdint.h|inttypes.h|" ${WRKSRC}/zentimer.h

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in docs/reference/html/*
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
