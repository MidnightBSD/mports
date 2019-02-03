# $MidnightBSD$

PORTNAME=	fltk
PORTVERSION=	1.3.3
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://fltk.org/pub/${PORTNAME}/${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform C++ graphical user interface toolkit

LICENSE=	lgpl

LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png \
		libjpeg.so:${PORTSDIR}/graphics/jpeg

USES=		pkgconfig
USE_XORG=	xft
USE_GL=		glu
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

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
	${REINPLACE_CMD} -e '/Fl_XFont_On_Demand/s,class,& FL_EXPORT,' \
		${WRKSRC}/FL/x.H
	${REINPLACE_CMD} -e 's,result = 0;,fl_open_display(); &,' \
		${WRKSRC}/src/Fl_x.cxx

.include <bsd.port.mk>
