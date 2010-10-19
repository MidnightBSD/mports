# $MidnightBSD: mports/print/hs-hscolour/Makefile,v 1.4 2010/09/07 23:48:14 laffer1 Exp $

PORTNAME=	hscolour
PORTVERSION=	1.10.1
PORTREVISION=	1
CATEGORIES=	print haskell
MASTER_SITES=	ftp://ftp.cs.york.ac.uk/pub/haskell/contrib/ \
		http://hackage.haskell.org/packages/archive/${PORTNAME}/${PORTVERSION}/
PKGNAMEPREFIX=	hs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Colourise Haskell code
LICENSE=	gpl2

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp

.if !defined(SLAVE)
BUILD_DEPENDS+=	ghc:${PORTSDIR}/lang/ghc
.else
NO_PKG_REGISTER=
.endif

GHC_VERSION=	6.8.3
HSCOLOUR_VERSION=	${PORTVERSION}

CABAL_CMD=	runghc Setup.hs

DATADIR=		${PREFIX}/share/${DISTNAME}
HSCOLOUR_LIBDIR_REL=	lib/${DISTNAME}
DOCSDIR=		${PREFIX}/share/doc/${DISTNAME}

PLIST_SUB=	GHC_VERSION=${GHC_VERSION} \
		HSCOLOUR_LIBDIR_REL=${HSCOLOUR_LIBDIR_REL} \
		HSCOLOUR_VERSION=${HSCOLOUR_VERSION} \

.SILENT:

do-configure:
	cd ${WRKSRC} && ${CABAL_CMD} configure --ghc --prefix=${PREFIX}
	${MKDIR} ${PREFIX}/lib/hscolour-${PORTVERSION}

do-build:
	cd ${WRKSRC} && ${CABAL_CMD} build
.if !defined(SLAVE)
	cd ${WRKSRC} && ${CABAL_CMD} register --gen-script
.endif

do-install:
	cd ${WRKSRC} && ${CABAL_CMD} install

post-install:
#	${STRIP_CMD} ${PREFIX}/bin/HsColour
.if !defined(SLAVE)
	${MKDIR} ${PREFIX}/${HSCOLOUR_LIBDIR_REL}
	cd ${WRKSRC} && ${INSTALL_SCRIPT} register.sh ${PREFIX}/${HSCOLOUR_LIBDIR_REL}/register.sh
.endif
	@${RM} -f ${PREFIX}/lib/ghc-${GHC_VERSION}/package.conf.old

.include <bsd.port.mk>
