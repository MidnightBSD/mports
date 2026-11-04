PORTNAME=	canna
PORTVERSION=	3.7p3
PORTREVISION=	12
CATEGORIES=	japanese
MASTER_SITES=	OSDN/canna
PKGNAMESUFFIX=	-server
DISTNAME=	Canna${PORTVERSION:S/.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kana-to-Kanji conversion system, binary part
WWW=		http://canna.sourceforge.jp/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

LIB_DEPENDS=	libcanna.so:japanese/canna-lib

USES=		imake tar:bzip2
USE_RC_SUBR=	canna
INSTALL_TARGET=	instserver instclient
PORTDOCS=	canna.bib canna.sty Imakefile README.jp Makefile \
		intern lisp man
MAKE_JOBS_UNSAFE=	yes

CANNA_CLIENTS=	canlisp cannacheck cannastat chkconc crfreq crxdic crxgram \
		cshost ctow dicar dpromdic dpxdic forcpp forsort kpdic wtoc
CANNA_CLIENT_SCRIPTS=	dpbindic mkbindic mkromdic
CANNA_CATDIC_LINKS=	addwords chmoddic cpdic delwords lsdic mkdic mvdic rmdic \
		syncdic

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

MAKE_ARGS+=	CCOPTIONS="-Wno-error=int-conversion"
FAKE_OPTS=	trueprefix

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/server/cannaserver ${FAKE_DESTDIR}${TRUE_PREFIX}/sbin/cannaserver
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/catdic/catdic ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/catdic
.for prog in ${CANNA_CLIENTS}
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/${prog}/${prog} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/${prog}
.endfor
.for prog in ${CANNA_CLIENT_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/cmd/${prog}/${prog} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/${prog}
.endfor
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/mergewd/mergeword ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/mergeword
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/splitwd/splitword ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/splitword
.for link in ${CANNA_CATDIC_LINKS}
	${LN} -sf catdic ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/${link}
.endfor
	${LN} -sf ../bin/catdic ${FAKE_DESTDIR}${TRUE_PREFIX}/sbin/cannakill
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} \
	    ${MAKEFILE} ${MAKE_ARGS} install.man
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/doc/canna
	cd ${WRKSRC}/doc && ${CP} -R ${PORTDOCS} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/doc/canna

.include <bsd.port.mk>
