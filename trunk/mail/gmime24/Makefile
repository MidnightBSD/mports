# $MidnightBSD$
# $FreeBSD: ports/mail/gmime24/Makefile,v 1.11 2011/08/11 19:19:39 kwm Exp $

PORTNAME=	gmime
PORTVERSION=	2.4.33
PORTREVISION?=	1
CATEGORIES?=	mail
MASTER_SITES=	GNOME
PKGNAMESUFFIX?=	-24

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library (written in C) for parsing and creating messages using MIME
LICENSE=	lgpl2.1

CONFLICTS=	gmime-1.0.*

SLAVEDIRS=	mail/gmime2-sharp

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}24
USE_GNOME?=	glib20
USES=		gmake pathfix pkgconfig iconv tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?=--with-html-dir=${PREFIX}/share/doc \
		--enable-mono=no \
		--program-transform-name="s/uuencode/gmime-uuencode/;s/uudecode/gmime-uudecode/;"
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib"
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}

LATEST_LINK?=	${PORTNAME}24

OPTIONS_DEFINE=	DOCS

PORTDOCS=	*


.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/*/Makefile.in

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for i in docs/reference/html/*
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
