# $MidnightBSD$

PORTNAME=	readline
PORTVERSION=	6.3${PATCHLEVEL}
CATEGORIES=	devel
MASTER_SITES=	GNU \
		ftp://ftp.cwru.edu/pub/bash/
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	${PORTNAME}-${PORTVERSION:C/^([0-9].[0-9]).*/\1/}

PATCH_SITES=	${MASTER_SITES}
PATCH_SITE_SUBDIR=${PORTNAME}/${PORTNAME}-${PORTVERSION:R}-patches

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for editing command lines as they are typed

LICENSE=	gpl3

OPTIONS_DEFINE=	TERMCAP DOCS
OPTIONS_DEFAULT=TERMCAP
TERMCAP_DESC=	Link against libtermcap

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_ARGS+=	--enable-shared

INFO=		readline rluserman history

PATCHES=	1 2 3 4 5 6 7 8
.for p in ${PATCHES:S/^/00/}
PATCHFILES+=	${PORTNAME}${PORTVERSION:R:S/.//}-${p:C/.*(...)$/\1/}
.endfor
PATCHLEVEL=	${PATCHES:M1:S/1/./}${PATCHES:Q:S/^/./:S/ /./g:E}

.include <bsd.mport.options.mk>

pre-configure:
	${REINPLACE_CMD} -e "s/dragonfly/midnightbsd/g" ${WRKSRC}/shlib/Makefile.in
.if ${PORT_OPTIONS:MTERMCAP}
	${REINPLACE_CMD} "s/SHOBJ_LDFLAGS =/SHOBJ_LDFLAGS = -ltermcap/" ${WRKSRC}/shlib/Makefile.in
.endif

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libreadline.so.6 \
		${PREFIX}/lib/libhistory.so.6

.include <bsd.port.mk>
