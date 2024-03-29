PORTNAME=	spleen
DISTVERSION=	2.0.0
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/fcambus/spleen/releases/download/${DISTVERSION}/
PKGNAMESUFFIX=	-font

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monospaced bitmap fonts for Xorg and vt(4)
WWW=		https://github.com/fcambus/spleen

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes

OPTIONS_DEFINE=		DOCS
OPTIONS_DEFAULT=	VT X11
OPTIONS_MULTI=		TYPE
OPTIONS_MULTI_TYPE=	VT X11
.if !exists(/usr/bin/vtfontcvt)
OPTIONS_EXCLUDE=	VT
.endif
OPTIONS_SUB=		yes

TYPE_DESC=	Font type
VT_DESC=	Install vt(4) fonts
X11_DESC=	Install Xorg bitmap fonts

X11_USES=	fonts
X11_USES_OFF=	fonts:none

do-build:
	@${DO_NADA}

do-build-VT-on:
.for sz in 5x8 6x12 8x16 12x24 16x32 32x64
	vtfontcvt ${WRKSRC}/spleen-${sz}.bdf ${WRKSRC}/spleen-${sz}.fnt
.endfor

do-build-X11-on:
	${GZIP_CMD} ${WRKSRC}/*.pcf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

do-install-VT-on:
	${INSTALL_DATA} ${WRKSRC}/*.fnt ${FAKE_DESTDIR}${FONTSDIR}

do-install-X11-on:
	${INSTALL_DATA} ${WRKSRC}/fonts.alias-spleen \
		${FAKE_DESTDIR}${FONTSDIR}/fonts.alias
	${INSTALL_DATA} ${WRKSRC}/*.otf ${WRKSRC}/*.pcf.gz \
		${FAKE_DESTDIR}${FONTSDIR}

.include <bsd.port.mk>
