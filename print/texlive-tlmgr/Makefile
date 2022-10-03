PORTNAME=	texlive
PORTVERSION=	${TEXLIVE_VERSION}
PORTREVISION=	1
CATEGORIES=	print perl5
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}/
PKGNAMESUFFIX=	-tlmgr
DISTFILES=	${PORTNAME}-${PORTVERSION}-extra${EXTRACT_SUFX} \
		${PORTNAME}-${PORTVERSION}-source${EXTRACT_SUFX} \
		${TLPKG_FILE}.tar.gz
DIST_SUBDIR=	TeX
EXTRACT_ONLY=	${PORTNAME}-${PORTVERSION}-extra${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TeXLive manager modules

LICENSE=	publicdom

RUN_DEPENDS=	tex-kpathsea>=6.3.3:devel/tex-kpathsea

USES=		cpe perl5 tar:xz
CPE_VENDOR=	tug
USE_PERL5=	run
USE_TEX=	kpathsea
PATCH_WRKSRC=	${WRKDIR}
NO_BUILD=	yes

TLPKG_FILE=			${PORTNAME}-${PORTVERSION}-tlpdb-full
EXTRACT_AFTER_ARGS_SOURCE=	| ${TAR} -xf - -C ${WRKDIR} \
				--no-same-permission --no-same-owner \
				${PORTNAME}-${PORTVERSION}-source/texk/texlive/linked_scripts/texlive

PATCH_WRKSRC=	${WRKDIR}

post-extract:
	${CAT} ${DISTDIR}/${DIST_SUBDIR}/${PORTNAME}-${PORTVERSION}-source${EXTRACT_SUFX} \
	    ${EXTRACT_AFTER_ARGS_SOURCE}

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${TEXMFDISTDIR}/scripts/texlive
	${INSTALL_SCRIPT} \
	    ${WRKDIR}/${PORTNAME}-${PORTVERSION}-source/texk/texlive/linked_scripts/texlive/tlmgr.pl \
	    ${STAGEDIR}${PREFIX}/${TEXMFDISTDIR}/scripts/texlive
	cd ${STAGEDIR}${PREFIX}/bin && \
	    ${LN} -s ../${TEXMFDISTDIR}/scripts/texlive/tlmgr.pl tlmgr
	@${MKDIR} ${STAGEDIR}${PREFIX}/${SITE_PERL_REL}/TeXLive
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}-${PORTVERSION}-extra/tlpkg/TeXLive/*.pm \
	    ${STAGEDIR}${PREFIX}/${SITE_PERL_REL}/TeXLive
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}-${PORTVERSION}-extra/tlpkg/TeXLive/trans.pl \
	    ${PREFIX}/${SITE_PERL_REL}/TeXLive
	@${MKDIR} ${PREFIX}/${TEXMFDISTDIR}
	${TOUCH} ${PREFIX}/${TEXMFDISTDIR}/.texlive-tlmgr
	${MKDIR} ${FAKE_DESTDIR}/var/db/tlpkg
	${TOUCH} ${FAKE_DESTDIR}/var/db/tlpkg/tlmgr.log
	${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/${TLPKG_FILE}.tar.gz -C \
	    ${FAKE_DESTDIR}/var/db/tlpkg/ texlive.tlpdb
	${INSTALL_DATA} ${LOCALBASE}/share/texmf-dist/web2c/texmf.cnf \
	    ${FAKE_DESTDIR}/var/db/tlpkg
	${MKDIR} ${FAKE_DESTDIR}/var/db/tlpkg/backups
	${MKDIR} ${FAKE_DESTDIR}/var/db/tlpkg/tlpobj
	${LN} -s /var/db/tlpkg ${STAGEDIR}${PREFIX}/share/tlpkg

.include <bsd.port.mk>
