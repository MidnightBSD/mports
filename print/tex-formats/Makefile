PORTNAME=	formats
PORTVERSION=	${TEXLIVE_VERSION}
PORTREVISION=	1
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

USES=		tex
USE_TEX=	base basic fmtutil texhash texmf web2c

NO_ARCH=	yes
NO_BUILD=	yes
#NO_INSTALL=	yes

TEXHASHDIRS=	${TEXMFVARDIR}
TEX_FORMATS=	amstex csplain eplain latex-bin metafont mex mptopdf \
		pdftex tex

post-extract:
	mkdir ${WRKSRC}
	mkdir ${FAKE_DESTDIR}

do-install:

.include <bsd.port.mk>
