PORTNAME=	xpdfopen
PORTVERSION=	0.86
PORTREVISION=	3
CATEGORIES=	print
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/
DISTNAME=	texlive-${TEXLIVE_VERSION}-source
DIST_SUBDIR=	TeX

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line utility for PDF viewers

LICENSE=	mit

USES=		localbase:ldflags tar:xz tex xorg
USE_XORG=	x11 xmu

EXTRACT_FILES=	build-aux utils/xpdfopen
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share

EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S,^,${DISTNAME}/,}

WRKSRC=		${WRKDIR}/${DISTNAME}/utils/xpdfopen

PLIST_FILES=	bin/pdfclose \
		bin/pdfopen \
		share/man/man1/pdfclose.1.gz \
		share/man/man1/pdfopen.1.gz

.include <bsd.port.mk>
