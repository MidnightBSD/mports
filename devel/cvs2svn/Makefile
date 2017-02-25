# $MidnightBSD$

PORTNAME=	cvs2svn
PORTVERSION=	2.4.0
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	http://cvs2svn.tigris.org/files/documents/1462/49237/ \
		FREEBSD_LOCAL/ohauer

# 2.4.0 -> svn r5392
PATCH_SITES=	FREEBSD_LOCAL/ohauer
PATCHREV=	5433
PATCHFILES=	${PORTNAME}-${PORTVERSION}-r${PATCHREV}.diff.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CVS to Subversion Repository Converter

LICENSE=	other

BUILD_DEPENDS=	${PYTHON_LIBDIR}/lib-dynload/gdbm.so:${PORTSDIR}/databases/py-gdbm
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		shebangfix python:2.7
USE_PYTHON=	distutils autoplist

SHEBANG_FILES=	cvs2svn cvs2git cvs2bzr *.py \
		contrib/* cvs2svn_lib/*.py \
		svntest/* cvs2svn_rcsparse/*.py

OPTIONS_MULTI=		SCM
OPTIONS_MULTI_SCM=	SUBVERSION GIT BAZAAR
OPTIONS_DEFAULT=	SUBVERSION

SUBVERSION_DESC=	Build with subversion support
GIT_DESC= 		Build with git support
BAZAAR_DESC= 		Build with Bazaar support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSUBVERSION}
LIB_DEPENDS+=	svn_swig_py-1.0:${PORTSDIR}/devel/py-subversion
.endif

.if ${PORT_OPTIONS:MGIT}
RUN_DEPENDS+=	${LOCALBASE}/bin/git:${PORTSDIR}/devel/git
.endif

.if ${PORT_OPTIONS:MBAZAAR}
RUN_DEPENDS+=	${LOCALBASE}/bin/bzr:${PORTSDIR}/devel/bzr
.endif

# documents from ${WRKSRC}/doc
DOCS1=		design-notes.txt making-releases.txt \
		revision-reader.txt symbol-notes.txt

# documents from ${WRKSRC}/www
DOCS2=		cvs2bzr.html cvs2git.html cvs2svn.html \
		faq.html features.html index.html issue_tracker.html \
		project_license.html project_tools.html

PORTDOCS:=	${DOCS1} ${DOCS2}

PORTEXAMPLES=	cvs2bzr-example.options cvs2git-example.options \
		cvs2hg-example.options cvs2svn-example.options

post-patch:
# be consistent with PORTVERSION
	@${REINPLACE_CMD} -e 's|2.5.0-dev|2.4.0|' \
		${WRKSRC}/PKG-INFO \
		${WRKSRC}/cvs2svn_lib/version.py

# The only thing different in this target vs. the one found in bsd.port.mk
# is that the extract command exit code is ignored.  tar exits with status
# 1 because the distfile contains a symlink that points nowhere.
do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
	@-for f in ${EXTRACT_ONLY}; do \
		if ! (cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/$$f ${EXTRACT_AFTER_ARGS});\
		then \
			exit 1; \
		fi; \
	done

post-build:
	${MAKE} man -C ${WRKSRC}

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCS1:S|^|${WRKSRC}/doc/|} ${DOCSDIR}/
	@${INSTALL_DATA} ${DOCS2:S|^|${WRKSRC}/www/|} ${DOCSDIR}/
.endif

.if ${PORT_OPTIONS:MEXAMPLES}
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${PORTEXAMPLES:S|^|${WRKSRC}/|} ${EXAMPLESDIR}/
.endif

.include <bsd.port.mk>
