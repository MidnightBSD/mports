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

LICENSE=	gpl2

USES=		cpe perl5 tar:xz tex
CPE_VENDOR=	tug
USE_PERL5=	run
USE_TEX=	kpathsea

NO_ARCH=	yes
NO_BUILD=	yes

TLPKG_FILE=			${PORTNAME}-${TEXLIVE_YEAR}0311-tlpdb-full
EXTRACT_AFTER_ARGS_SOURCE=	| ${TAR} -xf - -C ${WRKDIR} \
				--no-same-permission --no-same-owner \
				${PORTNAME}-${PORTVERSION}-source/texk/texlive/linked_scripts/texlive \
				${PORTNAME}-${PORTVERSION}-source/build-aux/config.guess

PATCH_WRKSRC=	${WRKDIR}

post-extract:
	${CAT} ${DISTDIR}/${DIST_SUBDIR}/${PORTNAME}-${PORTVERSION}-source${EXTRACT_SUFX} \
	    ${EXTRACT_AFTER_ARGS_SOURCE}

do-install:
	@${MKDIR} ${PREFIX}/${TEXMFDISTDIR}/scripts/texlive
	${INSTALL_SCRIPT} \
	    ${WRKDIR}/${PORTNAME}-${PORTVERSION}-source/texk/texlive/linked_scripts/texlive/tlmgr.pl \
	    ${PREFIX}/${TEXMFDISTDIR}/scripts/texlive
	cd ${PREFIX}/bin && \
	    ${LN} -s ../${TEXMFDISTDIR}/scripts/texlive/tlmgr.pl tlmgr
	# texlive-20230313-source/build-aux/config.guess
	# /usr/local/share/tlpkg/installer/config.guess
	@${MKDIR} ${PREFIX}/${SITE_PERL_REL}/TeXLive
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}-${PORTVERSION}-extra/tlpkg/TeXLive/*.pm \
	    ${PREFIX}/${SITE_PERL_REL}/TeXLive
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}-${PORTVERSION}-extra/tlpkg/TeXLive/trans.pl \
	    ${PREFIX}/${SITE_PERL_REL}/TeXLive
	@${MKDIR} ${PREFIX}/${TEXMFDISTDIR}
	${TOUCH} ${PREFIX}/${TEXMFDISTDIR}/.texlive-tlmgr
	${MKDIR} ${FAKE_DESTDIR}/var/db/tlpkg/installer
	${TOUCH} ${FAKE_DESTDIR}/var/db/tlpkg/tlmgr.log
	${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/${TLPKG_FILE}.tar.gz -C \
	    ${FAKE_DESTDIR}/var/db/tlpkg/ texlive.tlpdb
	${INSTALL_SCRIPT} \
	    ${WRKDIR}/${PORTNAME}-${PORTVERSION}-source/build-aux/config.guess \
	    ${FAKE_DESTDIR}/var/db/tlpkg/installer/
	${INSTALL_DATA} ${LOCALBASE}/share/texmf-dist/web2c/texmf.cnf \
	    ${FAKE_DESTDIR}/var/db/tlpkg
	${MKDIR} ${FAKE_DESTDIR}/var/db/tlpkg/backups
	${MKDIR} ${FAKE_DESTDIR}/var/db/tlpkg/tlpobj
	${LN} -s /var/db/tlpkg ${PREFIX}/share/tlpkg

.include <bsd.port.mk>
