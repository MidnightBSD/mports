PORTNAME=	openexr
PORTVERSION=	3.1.5
CATEGORIES=	graphics devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High dynamic-range (HDR) image file format

LICENSE=	bsd3

# exact version required to avoid hard-to-debug issues
LIB_DEPENDS=	libImath-3_1.so.29:math/Imath

USES=		cmake compiler:c++14-lang cpe pathfix pkgconfig

USE_GITHUB=	yes
GH_TUPLE=	AcademySoftwareFoundation:openexr:v${PORTVERSION}

USE_LDCONFIG=	yes
CMAKE_ARGS+=	-DCMAKE_DEBUG_POSTFIX=
CPPFLAGS+=	-I.
# must be linked with -l{thr|pthread} explicitly
LDFLAGS+=	-lpthread

PATCH_STRIP=	-p0

_MAJORVER=	3_1
_VER=		30
_MINVER=	5
_PLVER=		1

NO_TEST=	yes

PLIST_SUB+=	MAJORVER=${_MAJORVER} \
		VER=${_VER} \
		MINVER=${_MINVER} \
		PLVER=${_PLVER}

PORTDOCS=	*
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES
OPTIONS_SUB=	yes

_DOCSRCDIR1=	${WRKSRC}
_DOC_FILES1=	CHANGES.md CONTRIBUTING.md GOVERNANCE.md LICENSE.md SECURITY.md \
		CODE_OF_CONDUCT.md CONTRIBUTORS.md README.md

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${_DOC_FILES1:S|^|${_DOCSRCDIR1}/|} ${FAKE_DESTDIR}${DOCSDIR}

post-install-DOCS-off:
	-${RM} ${FAKE_DESTDIR}${DOCSDIR:H}/OpenEXR/*.pdf
	@${RMDIR} ${FAKE_DESTDIR}${PREFIX}/share/doc/${PORTNAME} 2>/dev/null || :

post-install-EXAMPLES-on:
	${MV} \
		${FAKE_DESTDIR}${PREFIX}/share/doc/OpenEXR/examples/ ${FAKE_DESTDIR}${EXAMPLESDIR}
	@${RMDIR} ${FAKE_DESTDIR}${PREFIX}/share/doc/OpenEXR 2>/dev/null || :

post-install-EXAMPLES-off:
	-${RM} -R ${FAKE_DESTDIR}${PREFIX}/share/doc/OpenEXR/examples/
	@${RMDIR} ${FAKE_DESTDIR}${PREFIX}/share/doc/OpenEXR 2>/dev/null || :

.include <bsd.port.mk>
