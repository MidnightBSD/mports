# New ports collection makefile for:    mtools
# Date created:         5 October 1994
# Whom:                 jmz
#
# $MidnightBSD$
# $FreeBSD: ports/emulators/mtools/Makefile,v 1.62 2009/01/14 09:12:16 miwi Exp $

PORTNAME=	mtools
PORTVERSION=	4.0.10
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	mtools

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of tools for manipulating MSDOS files

LICENSE=	gpl3

CONFLICTS_INSTALL=	multimarkdown-*

USES=		gmake makeinfo tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_header_malloc_h=no
CONFIGURE_ARGS=	--enable-xdf

SUB_FILES=	pkg-message

INFO=		mtools

OPTIONS_DEFINE=	ICONV X11
OPTIONS_DEFAULT=ICONV X11

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MICONV}
USES+=		iconv
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}
.else
CONFIGURE_ENV+=	ac_cv_header_iconv_h=no
.endif

.if ${PORT_OPTIONS:MX11}
USE_XORG=	x11 sm ice xau
PLIST_SUB=	X11=""
.else
CONFIGURE_ARGS+=	--without-x
PLIST_SUB=	X11="@comment "
MAKE_ENV+=	WITHOUT_X11=yes
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|^#define MT_SIZE_T size_t|#define MT_SIZE_T off_t|g' \
		${WRKSRC}/llong.h
	@${REINPLACE_CMD} -e 's|/etc/mtools.conf|${PREFIX}/etc/mtools.conf|g' \
		${WRKSRC}/mformat.c
.for f in mtools.5 mtools.texi
	@${REINPLACE_CMD} -e 's|/usr/local/etc/|${PREFIX}/etc/|g' \
		${WRKSRC}/${f}
.endfor

post-install:
	${INSTALL_DATA} ${WRKSRC}/mtools.conf ${STAGEDIR}${PREFIX}/etc/mtools.conf.sample
	@if [ ! -f ${STAGEDIR}${PREFIX}/etc/mtools.conf ]; then \
		cd ${STAGEDIR}${PREFIX}/etc && ${CP} -p mtools.conf.sample mtools.conf; \
	fi

.include <bsd.port.mk>
