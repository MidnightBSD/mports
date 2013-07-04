# $MidnightBSD: mports/devel/mercurial/Makefile,v 1.14 2013/02/18 03:07:27 laffer1 Exp $

PORTNAME=	mercurial
PORTVERSION=	2.5.2
CATEGORIES=	devel python
MASTER_SITES=	http://mercurial.selenic.com/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast lightweight source control management system
LICENSE=	gpl2

USE_PYTHON=	-2.7
USE_PYDISTUTILS=yes
PYDISTUTILS_PKGNAME=	${PORTNAME}
PYDISTUTILS_PKGVERSION=	${PORTVERSION}
PYDISTUTILS_EGGINFO=	${PORTNAME}-${PORTVERSION}-${PYTHON_VERSION:S/thon//}.egg-info

CONTRIB_FILES=	bash_completion \
		casesmash.py \
		check-code.py \
		convert-repo \
		debugcmdserver.py \
		debugshell.py \
		dumprevlog \
		hg-ssh \
		hgfixes/__init__.py \
		hgfixes/fix_bytes.py \
		hgfixes/fix_bytesmod.py \
		hgfixes/fix_leftover_imports.py \
		hgk \
		hgsh/Makefile \
		hgsh/hgsh.c \
		mercurial.el \
		mergetools.hgrc \
		mq.el \
		perf.py \
		pylintrc \
		python-hook-examples.py \
		sample.hgrc \
		shrink-revlog.py \
		simplemerge \
		tcsh_completion \
		tcsh_completion_build.sh \
		tmplrewrite.py \
		undumprevlog \
		zsh_completion \
		vim/HGAnnotate.vim \
		vim/hg-menu.vim \
		vim/hgcommand.vim \
		vim/hgtest.vim \
		vim/patchreview.txt \
		vim/patchreview.vim

DOCS=	CONTRIBUTORS COPYING README

MAN1=	hg.1
MAN5=	hgignore.5 hgrc.5

SUB_FILES=	pkg-message

.include <bsd.mport.options.mk>

post-patch:
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-setup.py
PLIST_SUB+=	NLS="@comment "
.endif

.if !defined(WITHOUT_MCA_BUNDLE)
RUN_DEPENDS+=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss
.endif

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${PREFIX}/man/man1/
	${INSTALL_MAN} ${WRKSRC}/doc/*.5 ${PREFIX}/man/man5/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	for f in ${DOCS}; do \
		${INSTALL_DATA} ${WRKSRC}/$${f} ${DOCSDIR}; \
	done
.endif
.if !defined(NOPORTDATA)
	${MKDIR} ${DATADIR}
	${MKDIR} ${DATADIR}/contrib
	${MKDIR} ${DATADIR}/contrib/hgfixes
	${MKDIR} ${DATADIR}/contrib/hgsh
	${MKDIR} ${DATADIR}/contrib/vim
	for f in ${CONTRIB_FILES}; do \
		${CP} -p ${WRKSRC}/contrib/$${f} ${DATADIR}/contrib/$${f}; \
	done
	${MKDIR} ${DATADIR}/www
	${INSTALL_DATA} ${WRKSRC}/*.cgi ${DATADIR}/www
	${INSTALL_DATA} ${WRKSRC}/contrib/hgweb.fcgi ${DATADIR}/www
	${INSTALL_DATA} ${WRKSRC}/contrib/hgweb.wsgi ${DATADIR}/www
.endif

.include <bsd.port.mk>
