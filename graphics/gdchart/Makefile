PORTNAME=	gdchart
PORTVERSION=	0.11.5
PORTREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	http://www.fred.net/brv/chart/ \
		ftp://ftp.nuug.no/pub/anders/distfiles/
DISTNAME=	${PORTNAME}${PORTVERSION}dev

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy to use fast C API for creating charts and graphs
WWW=		http://www.fred.net/brv/chart/

LICENSE=	NONE

LIB_DEPENDS=	libgd.so:graphics/gd \
		libfreetype.so:print/freetype2

USES=		jpeg uidfix
USE_LDCONFIG=	yes

MAKEFILE=	${FILESDIR}/Makefile
MAKE_ARGS=	PREFIX="${PREFIX}" LOCALBASE="${LOCALBASE}"

PORTDOCS=	README.txt
PORTEXAMPLES=	ft_samp.c gdc_pie_samp.c gdc_samp1.c gdc_samp2.c

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.mport.options.mk>

.if defined(NO_PROFILE)
PLIST_SUB+=	PROFILE="@comment "
.else
PLIST_SUB+=	PROFILE=""
.endif


CFLAGS+=	-Wno-error=incompatible-function-pointer-types


post-patch:
	@${REINPLACE_CMD} \
		-e 's/^#ifdef HAVE_JPEG/#ifndef NO_JPEG/' \
		-e 's/^#ifdef HAVE_LIBFREETYPE/#ifndef NO_LIBFREETYPE/' \
			${WRKSRC}/*.[ch]
# ft_samp.c and gdc_samp?.c miss #include "gdcpie.h"
	@${REINPLACE_CMD} \
		-e 's/^#include "gdc\.h"/#include "gdcpie.h"/' \
			${WRKSRC}/ft_samp.c \
			${WRKSRC}/gdc_samp?.c
# gdc_pie_samp.c misses #include "gdchart.h"
	@${REINPLACE_CMD} \
		-e 's/^#include "gdc\.h"/#include "gdchart.h"/' \
			${WRKSRC}/gdc_pie_samp.c

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.txt ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
