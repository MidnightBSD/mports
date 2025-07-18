PORTNAME=		sourcehansans
PORTVERSION=		2.001
DISTVERSIONSUFFIX=	R
CATEGORIES?=		japanese x11-fonts
PKGNAMESUFFIX?=		-otf
# Note: the following PKGNAMEPREFIX is here only for self-documenting purpose;
#       actual prefixing is done by the `japanese' category itself.
#PKGNAMEPREFIX?=	ja-

MAINTAINER=		ports@MidnightBSD.org
COMMENT?=		Japanese font by Adobe designed for user interfaces
WWW=			https://github.com/adobe-fonts/source-han-sans

LICENSE=		OFL11
LICENSE_FILE=		${WRKSRC}/LICENSE.txt

USES=			fonts
USE_GITHUB=		yes
GH_ACCOUNT=		adobe-fonts
GH_PROJECT=		source-han-sans

NO_ARCH=		yes
NO_BUILD=		yes
SUB_FILES=		pkg-message

OPTIONS_DEFINE=		HW
OPTIONS_SINGLE=		TYPE
OPTIONS_SINGLE_TYPE=	FULL SUBSET
OPTIONS_DEFAULT=	FULL
OPTIONS_SUB=		yes

HW_DESC=		Install the half-width font in addition to the full font
FULL_DESC=		Install the full font (can display all CJK)
SUBSET_DESC?=		Install the subset font (can display Japanese only)
SUBSET_PREVENTS=	HW
SUBSET_PREVENTS_MSG=	Half-width can only be installed in addition to the full font

FULL_VARS?=		FONTNAME=SourceHanSans SRCFONTSDIR=OTF/Japanese
SUBSET_VARS?=		FONTNAME=SourceHanSansJP SRCFONTSDIR=SubsetOTF/JP

SHS_HW_LANG?=		Japanese

# These are to maintain correct pkg description and file list for slave ports
DESCR=			${.CURDIR}/pkg-descr
PLIST=			${.CURDIR}/pkg-plist

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/${SRCFONTSDIR}/*.otf ${STAGEDIR}${FONTSDIR}

post-install-HW-on:
	${INSTALL_DATA} ${WRKSRC}/OTF/${SHS_HW_LANG}HW/*.otf ${FAKE_DESTDIR}${FONTSDIR}

.include <bsd.port.mk>
