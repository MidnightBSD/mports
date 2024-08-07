PORTNAME=	xmltex
PORTVERSION=	1.9
PORTREVISION=	4
CATEGORIES=	print
MASTER_SITES=	FREEBSD_LOCAL/tex
PKGNAMEPREFIX=	tex-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${TEXLIVE_VERSION}-freebsd
DIST_SUBDIR=	TeX
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-validating XML parser, written in TeX

LICENSE=	unknown

USES=		tar:xz tex
USE_TEX=	pdftex fmtutil

NO_ARCH=	yes
NO_BUILD=	yes

TEX_FORMATS=	xmltex
TEXHASHDIRS=	${TEXMFDISTDIR}

do-install:
	${TAR} -Jxf ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} \
		-C ${STAGEDIR}${PREFIX}/share \
		--strip-components 1 --no-same-permission --no-same-owner

.if defined(MAINTAINER_MODE)
_EXTRACT_FILES= \
	texmf-dist/tex/xmltex \
	texmf-dist/doc/otherformats/xmltex
_WRKSRC=	${WRKDIR}/${PKGNAMEPREFIX}${PORTNAME}-${TEXLIVE_VERSION}

_maintainer-extract:
	${MAKE} clean
	${MKDIR} ${_WRKSRC}
	${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME_TEXMF}${EXTRACT_SUFX} \
		-C ${_WRKSRC}$ \
		--strip-components 1 --no-same-permission --no-same-owner \
		${_EXTRACT_FILES:S,^,${DISTNAME_TEXMF}/,}

_maintainer-dist: _maintainer-extract
	${TAR} --options xz:compression-level=9 -Jcvf \
		${WRKDIR}/${PKGNAMEPREFIX}${PORTNAME}-${TEXLIVE_VERSION}-freebsd.tar.xz \
		-C ${WRKDIR} ${PKGNAMEPREFIX}${PORTNAME}-${TEXLIVE_VERSION}

.endif

.include <bsd.port.mk>
