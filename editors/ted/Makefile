PORTNAME=	ted
PORTVERSION=	2.23
PORTREVISION=	1
CATEGORIES=	editors
MASTER_SITES=	ftp://ftp.nluug.nl/pub/editors/ted/ \
		http://fossies.org/linux/misc/
EXTRACT_SUFX=	.src.tar.gz

MAINTAINER=	kazuok@midnightbsd.org
COMMENT=	X11 based RTF editor

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/gpl.txt

LIB_DEPENDS=	libpcre.so:devel/pcre \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff \
		libpaper.so:print/libpaper
RUN_DEPENDS=	gsfonts>0:print/gsfonts

WRKSRC=		${WRKDIR}/Ted-${PORTVERSION}

USES=		ghostscript:x11,run iconv pkgconfig xorg
USE_XORG=	xext xft
GNU_CONFIGURE=	yes
MAKE_ENV=	DEF_AFMDIR="-DAFMDIR=\"\\\"${AFMDIR}/\\\"\"" \
		DEF_INDDIR="-DINDDIR=\"\\\"${INDDIR}/\\\"\"" \
		DEF_DOCUMENT_DIR="-DDOCUMENT_DIR=\"\\\"${DOCSDIR}/\\\"\"" \
		DEF_PSSCRIPT_DIR="-DPSSCRIPT_DIR=\"\\\"${DATADIR}/\\\"\""
ALL_TARGET=	compile.shared
CONFIGURE_ARGS=	--datadir=${PREFIX}/share \
		ac_iconv_includes=${LOCALBASE}/include

DATADIR=	${PREFIX}/share/Ted
DOCSDIR=	${PREFIX}/share/doc/Ted

AFMDIR=		${DATADIR}/afm
INDDIR=		${DATADIR}/dfa

OPTIONS_DEFINE= DOCS

.include <bsd.port.pre.mk>

post-extract:
	@cd ${WRKSRC}/tedPackage && ${TAR} xf TedDatadir.tar
	@${INSTALL_SCRIPT} ${FILESDIR}/configure ${WRKSRC}

post-patch:
	@${FIND} ${WRKSRC} -name "configure" -print0 | ${XARGS} -0 \
		${REINPLACE_CMD} -e \
		's|/usr/X11R6|${LOCALBASE}|g ; \
		 s|/usr/local|${LOCALBASE}|g ; \
		 /paper.h/s|/usr/include|${LOCALBASE}/include|g ; \
		 /paper.h/s|/usr/lib|${LOCALBASE}/lib|g'
.if ! empty(ICONV_LIB)
	@${REINPLACE_CMD} 's|/iconv\.so|/libiconv.so|' \
		${WRKSRC}/Ted/configure ${WRKSRC}/textEncoding/configure
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/Ted/Ted ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/tedPackage/examples/rtf2*.sh ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/tedPackage/doc/Ted.1 ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/tedPackage/doc/rtf2*.1 ${MANPREFIX}/man/man1
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/tedPackage/ps/*.ps ${DATADIR}
	@${MKDIR} ${AFMDIR}
	${INSTALL_DATA} ${WRKSRC}/tedPackage/afm/*.afm ${AFMDIR}
	@${MKDIR} ${INDDIR}
	${INSTALL_DATA} ${WRKSRC}/tedPackage/dfa/*.dfa ${INDDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/tedPackage/TedDocument-en_US.rtf ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
