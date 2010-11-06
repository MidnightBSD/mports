# $MidnightBSD: mports/audio/flac/Makefile,v 1.8 2009/11/25 02:42:05 laffer1 Exp $

PORTNAME=	flac
PORTVERSION=	1.2.1
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-src/${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free lossless audio codec
LICENSE=	gpl2

LIB_DEPENDS=	ogg.7:${PORTSDIR}/audio/libogg

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-sse \
		--with-ogg="${LOCALBASE}" \
		--disable-thorough-tests \
		--disable-xmms-plugin
CONFIGURE_ENV=	CPPFLAGS="-I${WRKSRC}/include"
MAKE_JOBS_SAFE=	yes

.if !defined(WITHOUT_ICONV)
USE_ICONV=	yes
CONFIGURE_ARGS+=--with-libiconv-prefix="${LOCALBASE}"
.else
CONFIGURE_ARGS+=--without-libiconv-prefix
.endif

MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"
MAKE_ENV=	MAKEOBJDIR=/nonexistent		# ignore ${WRKSRC}/obj
.if defined(NOPORTDOCS)
MAKE_ENV+=	DOC=""
.else
MAKE_ENV+=	DOC=doc
.endif

USE_LDCONFIG=	yes
MAN1=		flac.1 metaflac.1

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
.endif

pre-patch:
	@${REINPLACE_CMD} 's:^docdir = $$(datadir)/doc/$$(PACKAGE)-$$(VERSION):docdir = $$(datadir)/doc/$$(PACKAGE):' \
		`find ${WRKSRC}/doc -name Makefile.in`

post-build:
	${REINPLACE_CMD} 's:%%PREFIX%%:${PREFIX}:' ${WRKSRC}/man/flac.1

regression-test: build
	@cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.post.mk>
