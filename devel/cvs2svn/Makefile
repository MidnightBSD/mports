# New ports collection makefile for:	cvs2svn
# Date created:		1 May 2004
# Whom:			Hye-Shik Chang
#
# $MidnightBSD: mports/devel/cvs2svn/Makefile,v 1.6 2010/11/17 13:57:58 laffer1 Exp $
# $FreeBSD: ports/devel/cvs2svn/Makefile,v 1.15 2008/03/16 23:05:51 araujo Exp $

PORTNAME=	cvs2svn
PORTVERSION=	2.3.0
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	http://www.sourcehosting.net/freebsd/distfiles/ \
		FREEBSD_LOCAL/glarkin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CVS to Subversion Repository Converter
LICENSE=	other

LIB_DEPENDS=	aprutil-1.3:${PORTSDIR}/devel/apr-svn
BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/gdbm.so:${PORTSDIR}/databases/py-gdbm
RUN_DEPENDS=	${BUILD_DEPENDS}

MAKE_JOBS_SAFE=	yes

USE_PYTHON=	2.5+
USE_PYDISTUTILS=	yes

OPTIONS=	SUBVERSION "Build with subversion support" on \
		GIT "Build with git support" off \
		BAZAAR "Build with Bazaar support" off

.include <bsd.port.pre.mk>

.if defined(WITHOUT_SUBVERSION) && defined(WITHOUT_GIT) && defined(WITHOUT_BAZAAR)
IGNORE=	choose at least one or more options from subversion, git or bazaar
.endif

.if defined(WITH_SUBVERSION)
RUN_DEPENDS+=	${LOCALBASE}/bin/svn:${PORTSDIR}/devel/py-subversion
.endif

.if defined(WITH_GIT)
RUN_DEPENDS+=	${LOCALBASE}/bin/git:${PORTSDIR}/devel/git
.endif

.if defined(WITH_BAZAAR)
RUN_DEPENDS+=	${LOCALBASE}/bin/bzr:${PORTSDIR}/devel/bazaar-ng
.endif

MAN1=		cvs2svn.1 \
		cvs2git.1 \
		cvs2bzr.1

PORTDOCS=	design-notes.txt making-releases.txt revision-reader.txt \
		  symbol-notes.txt cvs2bzr.html cvs2git.html cvs2svn.html \
		  faq.html features.html index.html issue_tracker.html \
		  project_license.html project_tools.html

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
		cd ${WRKSRC} && make man

post-install:
	@${INSTALL_MAN} ${WRKSRC}/cvs2svn.1 ${PREFIX}/man/man1/
	@${INSTALL_MAN} ${WRKSRC}/cvs2git.1 ${PREFIX}/man/man1/
	@${INSTALL_MAN} ${WRKSRC}/cvs2bzr.1 ${PREFIX}/man/man1/
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/design-notes.txt ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/doc/making-releases.txt ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/doc/revision-reader.txt ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/doc/symbol-notes.txt ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/cvs2bzr.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/cvs2git.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/cvs2svn.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/faq.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/features.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/index.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/issue_tracker.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/project_license.html ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/www/project_tools.html ${DOCSDIR}/
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/cvs2bzr-example.options ${EXAMPLESDIR}/
	@${INSTALL_DATA} ${WRKSRC}/cvs2git-example.options ${EXAMPLESDIR}/
	@${INSTALL_DATA} ${WRKSRC}/cvs2hg-example.options ${EXAMPLESDIR}/
	@${INSTALL_DATA} ${WRKSRC}/cvs2svn-example.options ${EXAMPLESDIR}/
.endif

.include <bsd.port.post.mk>
