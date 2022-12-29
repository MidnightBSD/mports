PORTNAME=	heirloom-doctools
PORTVERSION=	160308
PORTREVISION=	1
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable and enhanced troff, nroff, and related utilities
WWW=		https://n-t-roff.github.io/heirloom/doctools.html

LICENSE=	cddl

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	n-t-roff

CONFLICTS_INSTALL=	grap groff ja-groff util-linux # bin/col bin/eqn bin/grap bin/indxbib

ALL_TARGET=	#empty
MAKE_ARGS+=	INSTALL="${INSTALL}" \
		BINDIR=${BINDIR} \
		LIBDIR=${LIBDIR} \
		PUBDIR=${PUBDIR} \
		MANDIR=${MANDIR} \
		MACDIR=${MACDIR} \
		FNTDIR=${FNTDIR} \
		PSTDIR=${PSTDIR} \
		TABDIR=${TABDIR} \
		HYPDIR=${HYPDIR} \
		REFDIR=${REFDIR} \
		ROOT=${FAKE_DESTDIR}
MAKEFILE=	makefile
CFLAGS+=	-fcommon
PLIST_SUB=	LIBEXECDIR=libexec/${PORTNAME}

MACDIR?=	${DATADIR}/tmac
FNTDIR?=	${DATADIR}/font
TABDIR?=	${DATADIR}/nterm
HYPDIR?=	${DATADIR}/hyphen
REFDIR?=	${PREFIX}/libexec/${PORTNAME}/reftools
PUBDIR?=	${DATADIR}/pub
BINDIR?=	${PREFIX}/bin
LIBDIR?=	${PREFIX}/libexec/${PORTNAME}
PSTDIR?=	${DATADIR}/font/devpost/postscript
MANDIR?=	${PREFIX}/man

PORTDOCS=	 *

MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} CHANGES README ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} LICENSE ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
