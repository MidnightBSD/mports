PORTNAME=	mercurial
PORTVERSION=	6.9
CATEGORIES=	devel python
MASTER_SITES=	https://www.mercurial-scm.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, lightweight source control management system
WWW=		https://www.mercurial-scm.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe python shebangfix
SHEBANG_FILES=	contrib/hgweb.fcgi hgweb.cgi
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=		CA_BUNDLE DATA DOCS NLS
OPTIONS_DEFAULT=	CA_BUNDLE DATA
OPTIONS_SUB=		yes

CA_BUNDLE_DESC=		Install CA Certificates
CA_BUNDLE_RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
DATA_SUB_FILES=		pkg-message
NLS_EXTRA_PATCHES_OFF=	${FILESDIR}/extra-patch-setup.py
NLS_USES=		gettext

CONTRIB_FILES=	bash_completion \
		casesmash.py \
		check-code.py \
		debugcmdserver.py \
		debugshell.py \
		dumprevlog \
		hg-ssh \
		hgk \
		hgsh/Makefile \
		hgsh/hgsh.c \
		mercurial.el \
		mq.el \
		pylintrc \
		python-hook-examples.py \
		simplemerge \
		tcsh_completion \
		tcsh_completion_build.sh \
		undumprevlog \
		zsh_completion \
		vim/HGAnnotate.vim \
		vim/hg-menu.vim \
		vim/hgcommand.vim \
		vim/hgtest.vim \
		vim/patchreview.txt \
		vim/patchreview.vim
PORTDOCS=	CONTRIBUTORS README.rst

.include <bsd.port.pre.mk>

.if ${PYTHON_VER} != ${PYTHON_DEFAULT}
PKGNAMEPREFIX=		${PYTHON_PKGNAMEPREFIX}
.endif

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${PREFIX}/share/man/man1/
	${INSTALL_MAN} ${WRKSRC}/doc/*.5 ${PREFIX}/share/man/man5/
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/ -name '*.so' -exec ${STRIP_CMD} {} +

post-install-DATA-on:
.for d in hgsh vim
	${MKDIR} ${FAKE_DESTDIR}${DATADIR}/contrib/${d}
.endfor
	${MKDIR} ${FAKE_DESTDIR}${DATADIR}/www
.for f in ${CONTRIB_FILES}
	${INSTALL_DATA} ${WRKSRC}/contrib/${f} \
		${FAKE_DESTDIR}${DATADIR}/contrib/${f}
.endfor
	${INSTALL_DATA} ${WRKSRC}/hgweb.cgi ${WRKSRC}/contrib/hgweb.* ${FAKE_DESTDIR}${DATADIR}/www

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.post.mk>
