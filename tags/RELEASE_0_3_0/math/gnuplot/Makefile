# New ports collection makefile for:    gnuplot
# Date created:         19 April 1998
# Whom:                 chuckr
#
# $MidnightBSD: mports/math/gnuplot/Makefile,v 1.10 2008/11/12 20:04:43 ctriv Exp $
# $FreeBSD: ports/math/gnuplot/Makefile,v 1.62 2006/05/10 22:37:08 edwin Exp $
#

PORTNAME=	gnuplot
PORTVERSION=	4.2.6
PORTREVISION=	2
CATEGORIES=	math graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command-driven interactive function plotting program
LICENSE=	other

USE_ICONV=	yes
USE_GCPIO=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=--with-lasergnu \
		--with-readline=gnu \
		--without-linux-vga \
		--without-lisp-files \
		--without-tutorial

OPTIONS=	GD		"Enable GD support"		on \
		GRIDBOX		"Use the gridbox optimization for hidden3d" off \
		PDF		"Enable PDF support"		on \
		PLOT		"Enable plot support"		on \
		TETEX		"Search kpsexpand at run-time"	on \
		THINSPLINES	"Enable thin plate splines for grids in dgrid3d" off \
		WX		"Enable WX support"		off

MAN1=		gnuplot.1 lasergnu.1
INFO=		gnuplot

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_X11)
USE_XORG=		x11
PLIST_SUB+=		X11=""
.else
CONFIGURE_ARGS+=	--without-x
PLIST_SUB+=		X11="@comment "
.endif

.if defined(WITHOUT_GD)
CONFIGURE_ARGS+=	--without-gd
.else
LIB_DEPENDS+=		gd.4:${PORTSDIR}/graphics/gd
CONFIGURE_ARGS+=	--with-gd=${LOCALBASE}
.endif

.if !defined(WITHOUT_GRIDBOX)
CONFIGURE_ARGS+=	--disable-h3d-quadtree --enable-h3d-gridbox
.endif

.if defined(WITHOUT_PDF)
CONFIGURE_ARGS+=	--without-pdf
.else
LIB_DEPENDS+=		pdf.8:${PORTSDIR}/print/pdflib
CONFIGURE_ARGS+=	--with-pdf=${LOCALBASE}
.endif

.if defined(WITHOUT_PLOT)
CONFIGURE_ARGS+=	--without-plot
.else
USE_XORG+=		xaw xmu xt xext
LIB_DEPENDS+=		plot.4:${PORTSDIR}/graphics/plotutils
CONFIGURE_ARGS+=	--with-plot=${LOCALBASE}
.endif

.if defined(WITHOUT_TETEX)
PLIST_SUB+=		TETEX="@comment "
.else
BUILD_DEPENDS+=		latex:${PORTSDIR}/print/teTeX-base
CONFIGURE_ARGS+=	--with-kpsexpand
PLIST_SUB+=		TETEX=""
.endif

.if defined(WITHOUT_THINSPLINES)
CONFIGURE_ARGS+=	--disable-thin-splines
.else
CONFIGURE_ARGS+=	--enable-thin-splines
.endif

.if defined(WITHOUT_WX)
CONFIGURE_ARGS+=	--disable-wxwidgets
.else
USE_WX=			2.4+
WX_CONF_ARGS=		absolute
.endif

.include <bsd.port.pre.mk>

post-patch:
.if defined(WITHOUT_TETEX)
	@${REINPLACE_CMD} -e \
		'/^install:/s/install-am//' ${WRKSRC}/share/LaTeX/Makefile.in
.endif
	@${FIND} ${WRKSRC} -name Makefile.in | \
                ${XARGS} ${REINPLACE_CMD} \
                -e "s|@LIBICONV@|-liconv|g";
	@${REINPLACE_CMD} -e \
		's|)/@PACKAGE@/@PKG_MAJOR@|)|g' ${WRKSRC}/src/Makefile.in
	@${FIND} "${WRKSRC}" -name '*.orig' -delete

post-configure:
	${FIND} ${WRKSRC} -name 'Makefile' | \
		${XARGS} ${REINPLACE_CMD} \
		-e 's|@LIBICONV@|-liconv|';

.if !defined(NOPORTDOCS)
post-build:
	@cd ${WRKSRC}/docs && ${MAKE} groff
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/lasergnu ${PREFIX}/bin
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC}/demo && ${FIND} . \
		| ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${EXAMPLESDIR}
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/psdoc
	cd ${WRKSRC}/docs && ${INSTALL_DATA} gnuplot.txt gnuplot.dvi \
		gnuplot.ps ${DOCSDIR}
	cd ${WRKSRC}/docs/psdoc && ${INSTALL_DATA} README ps_* ${DOCSDIR}/psdoc
.endif

.include <bsd.port.post.mk>
