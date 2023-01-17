PORTNAME=	formats
PORTVERSION=	${TEXLIVE_VERSION}
CATEGORIES=	print
MASTER_SITES=	#empty
PKGNAMEPREFIX=	tex-
DISTFILES=	#empty
EXTRACT_ONLY=	#empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Formats for basic TeX engines and the latex command
WWW=		https://tug.org/texlive/

LICENSE=	unknown

# seems to need a perl module included with this port to build
BUILD_DEPENDS+=	texlive-tlmgr>0:print/texlive-tlmgr

USE_TEX=	basic fmtutil texhash texmf web2c
TEXHASHDIRS=	${TEXMFVARDIR}
TEX_FORMATS=	amstex context csplain eplain latex-bin metafont mex mptopdf \
		pdftex tex

NO_ARCH=	yes
NO_BUILD=	yes

post-extract:
	mkdir ${WRKSRC}
	mkdir ${FAKE_DESTDIR}

do-install:

.include <bsd.port.mk>
