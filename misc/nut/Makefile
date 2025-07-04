PORTNAME=	nut
PORTVERSION=	20.1
PORTREVISION=	3
CATEGORIES=	misc
MASTER_SITES=	SF
PKGNAMEPREFIX=	health-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nutrition software to record what you eat
WWW=		https://nut.sourceforge.net/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake

DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}
PORTDOCS=	CREDITS README nut.html

OPTIONS_DEFINE=	FLTK DOCS
OPTIONS_SUB=	yes

FLTK_DESC=		Install FLTK GUI
FLTK_LIB_DEPENDS=	libpthread-stubs.so:devel/libpthread-stubs \
			libfreetype.so:print/freetype2 \
			libexpat.so:textproc/expat2 \
			libfontconfig.so:x11-fonts/fontconfig \
			libfltk_images.so:x11-toolkits/fltk
FLTK_USES=		xorg
FLTK_USE=		XORG=x11,xau,xcb,xcursor,xdmcp,xext,xfixes,xft,xinerama,xpm,xrender
FLTK_MAKE_ENV=		HAVE_FLTK=1 FLTK_NUT="fltk/Nut"
FLTK_MAKE_ENV_OFF=	HAVE_FLTK=0 FLTK_NUT=""
FLTK_DESKTOP_ENTRIES=	"Nut" "" "nuticon" "Nut" "Science;Biology;MedicalSoftware;" false

.include <bsd.mport.options.mk>

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile" | ${XARGS} ${REINPLACE_CMD} -e \
		's|$$(prefix)/lib/nut|${DATADIR}| ; \
		 s|^HAVE_FLTK|#HAVE_FLTK| ; \
		 s|^FLTK_NUT|#FLTK_NUT| ; \
		 s|^CC =|CC ?=| ; \
		 s|^CXX =|CXX ?=| ; \
		 s|^CFLAGS :=|CFLAGS +=| ; \
		 s|$$(OPT)||'

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/nut ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/nut.1 ${STAGEDIR}${PREFIX}/share/man/man1
	@${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WRKSRC}/raw.data && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

do-install-FLTK-on:
	${INSTALL_PROGRAM} ${WRKSRC}/fltk/Nut ${FAKE_DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/nuticon.xpm ${FAKE_DESTDIR}${PREFIX}/share/pixmaps

.include <bsd.port.mk>
