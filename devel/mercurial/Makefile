# Ports collection makefile for:	mercurial
# Date created:				May 20 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/devel/mercurial/Makefile,v 1.4 2009/03/25 16:56:02 laffer1 Exp $
#

PORTNAME=	mercurial
PORTVERSION=	1.3.1
CATEGORIES=	devel python
MASTER_SITES=	http://mercurial.selenic.com/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast, lightweight source control management system
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_PYTHON=	2.4+
USE_PYDISTUTILS=yes
PYDISTUTILS_PKGNAME=    ${PORTNAME}
PYDISTUTILS_PKGVERSION= ${PORTVERSION}
PYDISTUTILS_EGGINFO=    ${PORTNAME}-${PORTVERSION}-${PYTHON_VERSION:S/thon//}.egg-info

CONTRIB_FILES=	bash_completion \
		convert-repo \
		dumprevlog \
		hg-relink \
		hg-ssh \
		hgdiff \
		hgk \
		logo-droplets.svg \
		mercurial.el \
		mq.el \
		sample.hgrc \
		simplemerge \
		tcsh_completion \
		undumprevlog \
		zsh_completion \
		git-viz/git-cat-file \
		git-viz/git-diff-tree \
		git-viz/git-rev-list \
		git-viz/git-rev-tree \
		git-viz/hg-viz \
		hgsh/Makefile \
		hgsh/hgsh.c \
		vim/HGAnnotate.vim \
		vim/hg-menu.vim \
		vim/hgcommand.vim \
		vim/patchreview.txt \
		vim/patchreview.vim

DOCS=	CONTRIBUTORS COPYING README doc/*.txt doc/*.html

MAN1=	hg.1
MAN5=	hgignore.5 hgrc.5

PKGMESSAGE=	${WRKDIR}/MESSAGE

post-build:
	@${SED} -e 's,%%PREFIX%%,${PREFIX},g' ${PKGDIR}/pkg-message > ${PKGMESSAGE}

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${PREFIX}/man/man1/
	${INSTALL_MAN} ${WRKSRC}/doc/*.5 ${PREFIX}/man/man5/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	for f in ${DOCS}; do \
		${INSTALL_MAN} ${WRKSRC}/$${f} ${DOCSDIR}; \
	done
.endif
.if !defined(NOPORTDATA)
	${MKDIR} ${DATADIR}
	${MKDIR} ${DATADIR}/contrib
	${MKDIR} ${DATADIR}/contrib/git-viz
	${MKDIR} ${DATADIR}/contrib/hgsh
	${MKDIR} ${DATADIR}/contrib/vim
	for f in ${CONTRIB_FILES}; do \
		${CP} -p ${WRKSRC}/contrib/$${f} ${DATADIR}/contrib/$${f}; \
	done
	${MKDIR} ${DATADIR}/www
	${INSTALL_MAN} ${WRKSRC}/*.cgi ${DATADIR}/www
	${INSTALL_MAN} ${WRKSRC}/contrib/hgwebdir.fcgi ${DATADIR}/www
	${INSTALL_MAN} ${WRKSRC}/contrib/hgwebdir.wsgi ${DATADIR}/www
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
