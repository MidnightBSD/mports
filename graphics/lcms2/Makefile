# $MidnightBSD$
# $FreeBSD: ports/graphics/lcms2/Makefile,v 1.12 2011/12/17 15:07:28 sunpoet Exp $

PORTNAME=	lcms2
PORTVERSION=	2.3
CATEGORIES=	graphics
MASTER_SITES=	SF/lcms/lcms/${PORTVERSION} \
		http://www.littlecms.com/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accurate, fast, and small-footprint color management engine
LICENSE=	mit

OPTIONS=	TIFFICC "Build color profile applier for TIFF" off \
		JPEGICC "Build color profile applier for JPEG" off

CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
LDFLAGS+=	-L${LOCALBASE}/lib
USE_GNOME=	gnomehack lthack
USE_LDCONFIG=	yes

MAN1=		transicc.1 psicc.1 linkicc.1
PLIST_SUB=	PORTVERSION=${PORTVERSION}

UTILS=		transicc psicc linkicc

.include <bsd.mport.options.mk>

.if defined(WITH_TIFFICC)
LIB_DEPENDS+=	tiff.4:${PORTSDIR}/graphics/tiff
UTILS+=		tificc
MAN1+=		tificc.1
PLIST_SUB+=	TIFFICC=""
.else
CONFIGURE_ARGS=	--without-tiff
PLIST_SUB+=	TIFFICC="@comment "
.endif

.if defined(WITH_JPEGICC)
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg
UTILS+=		jpgicc
MAN1+=		jpgicc.1
PLIST_SUB+=	JPEGICC=""
.else
CONFIGURE_ARGS=	--without-jpeg
PLIST_SUB+=	JPEGICC="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^SUBDIRS =.*$$|SUBDIRS = src include|' \
		${WRKSRC}/Makefile.in

post-configure:
# Get rid of .la and static library files
	@${REINPLACE_CMD} -E -e \
		'/Install the pseudo-library/,/staticlibs=/s,^,#,' \
			${WRKSRC}/libtool

post-build:
.for dir in ${UTILS}
	@cd ${WRKSRC}/utils/${dir}/ && ${SETENV} ${MAKE_ENV} ${MAKE} \
		${MAKE_FLAGS} ${FAKE_MAKEARGS} ${MAKEFILE} all
.endfor

post-install:
.for dir in ${UTILS}
	@cd ${WRKSRC}/utils/${dir}/ && ${SETENV} ${MAKE_ENV} ${MAKE} \
		${MAKE_FLAGS} ${FAKE_MAKEARGS} ${MAKEFILE} install
.endfor
	${INSTALL_MAN} ${WRKSRC}/utils/linkicc/linkicc.1 \
		${WRKSRC}/utils/psicc/psicc.1 \
		${WRKSRC}/utils/transicc/transicc.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.pdf ${DOCSDIR}
.endif

regression-test test: build
	@cd ${WRKSRC}/testbed/ && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
