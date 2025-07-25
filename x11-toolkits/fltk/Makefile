PORTNAME=	fltk
PORTVERSION=	1.3.8
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	https://www.fltk.org/pub/${PORTNAME}/${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform C++ graphical user interface toolkit
WWW=		https://www.fltk.org/

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpng.so:graphics/png \
		libfontconfig.so:x11-fonts/fontconfig

USES=		cpe gettext-runtime gl jpeg localbase pkgconfig tar:bz2 xorg
CPE_VENDOR=	fltk_project
USE_XORG=	x11 xcursor xext xfixes xft xinerama xrender
USE_GL=		gl glu
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared
CONFIGURE_ENV=	NROFF=echo

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-patch: .SILENT
	prefix="${PREFIX}" ; plength=$$(($${#prefix}+10)) ; \
	${REINPLACE_CMD} -e "\|/etc/fltk|{s||${PREFIX}&|;s|10|$${plength}|;}" \
		${WRKSRC}/src/Fl_Preferences.cxx
	${REINPLACE_CMD} -e 's,$$(docdir)/examples,${EXAMPLESDIR},' \
		${WRKSRC}/test/Makefile
	${REINPLACE_CMD} -e '/^INSTALL_BIN/s,-m,${STRIP} &, ; \
		s,^\.SILENT,#&,' ${WRKSRC}/makeinclude.in
	${REINPLACE_CMD} -E \
		's,(.*)LDFLAGS(.*)LINKSHARED(.*),\1LINKSHARED\2LDFLAGS\3,' \
			${WRKSRC}/fluid/Makefile

post-install:
.for x in fltk fltk_forms fltk_gl fltk_images
	${LN} -sf lib${x}.so.${PORTVERSION:R} \
		${STAGEDIR}${PREFIX}/lib/lib${x}.so.1
.endfor

.include <bsd.port.mk>
