# New ports collection makefile for:	gmime2
# Date created:				16 Apr 2001
# Whom:					Kirill Ponomarew <ponomarew@oberon.net>
#
# $MidnightBSD: mports/mail/gmime2/Makefile,v 1.2 2007/11/14 18:54:43 laffer1 Exp $
# $FreeBSD: ports/mail/gmime2/Makefile,v 1.53 2007/07/21 20:01:57 mnag Exp $
#

PORTNAME=	gmime
PORTVERSION=	2.2.18
PORTREVISION?=	0
CATEGORIES?=	mail
MASTER_SITES=	http://spruce.sourceforge.net/gmime/sources/v${PORTVERSION:C/([0-9]\.[0-9]).*/\1/}/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library (written in C) for parsing and creating messages using MIME
LICENSE=	lgpl

CONFLICTS=	gmime-1.0.*

SLAVEDIRS=	mail/gmime2-sharp

USE_ICONV=	yes
USE_GMAKE=	yes
USE_GNOME?=	gnomehack gnometarget glib20
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
