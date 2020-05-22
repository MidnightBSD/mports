# Created by: Manuel Giraud <manuel.giraud@gmail.com>

PORTNAME=	profont
PORTVERSION=	400
CATEGORIES=	x11-fonts
MASTER_SITES=	FREEBSD_LOCAL/tobik \
		http://tobiasjung.name/downloadfile.php?file=profont-x11.zip?dummy/
DISTNAME=	${PORTNAME}-x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ultimate programming font

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		zip

NO_ARCH=	yes

OPTIONS_DEFAULT=	VT X11
OPTIONS_MULTI=		TYPE
OPTIONS_MULTI_TYPE=	VT X11
.if !exists(/usr/bin/vtfontcvt)
OPTIONS_EXCLUDE=	VT
.endif
OPTIONS_SUB=		yes

TYPE_DESC=		Font type
VT_DESC=		Install vt(4) fonts
X11_DESC=		Install Xorg bitmap fonts

VT_BUILD_DEPENDS=	pcf2bdf:x11-fonts/pcf2bdf \
			vtfontcvt-ng:x11-fonts/vtfontcvt-ng

X11_USES=		fonts
X11_USES_OFF=		fonts:none

do-build:
	@${DO_NADA}

do-build-VT-on:
.for h in 10 11 12 15 17 22 29
	pcf2bdf -o ${WRKSRC}/ProFont_r400-${h}.bdf \
		${WRKSRC}/ProFont_r400-${h}.pcf
	vtfontcvt-ng ${WRKSRC}/ProFont_r400-${h}.bdf \
		${WRKSRC}/ProFont_r400-${h}.fnt
.endfor

do-build-X11-on:
	${GZIP_CMD} ${WRKSRC}/*.pcf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}

do-install-VT-on:
	${INSTALL_DATA} ${WRKSRC}/*.fnt ${FAKE_DESTDIR}${FONTSDIR}

do-install-X11-on:
	${INSTALL_DATA} ${FILESDIR}/fonts.alias ${WRKSRC}/*.pcf.gz \
		${FAKE_DESTDIR}${FONTSDIR}

.include <bsd.port.mk>
