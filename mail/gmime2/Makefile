PORTNAME=	gmime
PORTVERSION=	2.2.27
PORTREVISION?=	1
CATEGORIES?=	mail
MASTER_SITES=	GNOME
PKGNAMESUFFIX?=	2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library (written in C) for parsing and creating messages using MIME

LICENSE=	lgpl2.1

CONFLICTS=	gmime-1.0.* gmime-2.4.*

SLAVEDIRS=	mail/gmime2-sharp

USE_GNOME?=	glib20
USES=		gmake gnome libtool pathfix pkgconfig iconv
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS?=	--with-libiconv=${LOCALBASE} \
			--with-html-dir=${PREFIX}/share/doc \
			--enable-mono=no \
			--program-transform-name="s/uuencode/gmime-uuencode/;s/uudecode/gmime-uudecode/;"
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib"
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}

OPTIONS_DEFINE=	DOCS

PORTDOCS=	*


.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e "s|stdint.h|inttypes.h|" ${WRKSRC}/zentimer.h
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/gmime/Makefile.in

post-install:
.if  ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for i in docs/reference/html/*
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
