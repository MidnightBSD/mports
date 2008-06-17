# New ports collection makefile for:    gnuplot
# Date created:         19 April 1998
# Whom:                 chuckr
#
# $MidnightBSD: mports/math/gnuplot/Makefile,v 1.4 2007/08/07 00:55:58 laffer1 Exp $
# $FreeBSD: ports/math/gnuplot/Makefile,v 1.62 2006/05/10 22:37:08 edwin Exp $
#

PORTNAME=	gnuplot
PORTVERSION=	4.0.0
PORTREVISION=	5
CATEGORIES=	math graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command-driven interactive function plotting program
LICENSE=	other

USE_GCPIO=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--without-tutorial \
		--without-linux-vga \
		--with-lasergnu

OPTIONS=	GD		"Enable GD support"		on \
		HISTOGRAMS	"Enable stacked histograms"	off \
		PDF		"Enable PDF support"		on \
		PNG		"Enable PNG support"		on \
		READLINE	"Enable readline support"	on

MAN1=		gnuplot.1 lasergnu.1
INFO=		gnuplot

.if exists(${PREFIX}/bin/emacs) || exists(${PREFIX}/bin/xemacs)
USE_EMACS=	yes
EMACS_PORT_NAME=	emacs21
EMACS_NO_BUILD_DEPENDS=	yes
EMACS_NO_RUN_DEPENDS=	yes
CONFIGURE_ARGS+=	--with-lisp-files
.else
PLIST_SUB+=		EMACS_SITE_LISPDIR="@comment "
CONFIGURE_ARGS+=	--without-lisp-files
.endif

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_READLINE)
CONFIGURE_ARGS+=	--with-readline=gnu
.endif

.if !defined(WITHOUT_X11)
USE_XLIB=		yes
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

.if defined(WITHOUT_PDF)
CONFIGURE_ARGS+=	--without-pdf
.else
LIB_DEPENDS+=		pdf.8:${PORTSDIR}/print/pdflib
CONFIGURE_ARGS+=	--with-pdf=${LOCALBASE}
.endif

.if defined(WITHOUT_PNG)
CONFIGURE_ARGS+=	--without-png
.else
LIB_DEPENDS+=		png.5:${PORTSDIR}/graphics/png
CONFIGURE_ARGS+=	--with-png=${LOCALBASE}
.endif

.if defined(WITH_HISTOGRAMS)
PATCH_SITES=		http://www.bmsc.washington.edu/people/merritt/gnuplot/
PATCHFILES=		datastrings_4.0.patch histograms_4.0.patch
PATCH_DIST_STRIP=	-p1
USE_AUTOTOOLS=		autoconf:259
CONFIGURE_ARGS+=	--enable-datastrings \
			--enable-histograms
PLIST_SUB+=		HISTOGRAMS=""
.else
PLIST_SUB+=		HISTOGRAMS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|)/@PACKAGE@/@PKG_MAJOR@|)|g' ${WRKSRC}/src/Makefile.in
	@${FIND} "${WRKSRC}" -name '*.orig' -delete

.if !defined(NOPORTDOCS)
post-build:
	@cd ${WRKSRC}/docs && ${MAKE} groff html
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/lasergnu ${PREFIX}/bin
.if exists(${PREFIX}/bin/emacs) || exists(${PREFIX}/bin/xemacs)
	${INSTALL_DATA} ${WRKSRC}/lisp/gnuplot*.el ${EMACS_SITE_LISPDIR}
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC}/demo && ${FIND} . \
		| ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${EXAMPLESDIR}
	@${MKDIR} ${DOCSDIR}/psdoc
	cd ${WRKSRC}/docs && ${INSTALL_DATA} gnuplot.txt gnuplot.html \
		gnuplot.dvi gnuplot.ps ${DOCSDIR}
	cd ${WRKSRC}/docs/psdoc && ${INSTALL_DATA} README ps_* ${DOCSDIR}/psdoc
.endif

.include <bsd.port.post.mk>
