PORTNAME=	gitolite
DISTVERSIONPREFIX=	v
DISTVERSION=	3.6.12
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Access control layer on top of git
WWW=		https://github.com/sitaramc/gitolite

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	git>=0:devel/git \
		p5-JSON>=0:converters/p5-JSON

USES=		cpe perl5 shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	sitaramc

SHEBANG_REGEX=	.*
bash_CMD=	/bin/sh

CONFLICTS=	gitolite-[^3]*

NO_ARCH=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=		CONTRIB DOCS GITUSER
OPTIONS_DEFAULT=	CONTRIB
OPTIONS_SUB=		yes

CONTRIB_DESC=	Install additional contrib files
GITUSER_DESC=	Create git user as gitolite provider

GITUSER_VARS=	GROUPS=git \
		USERS=git

post-patch:
	@${REINPLACE_CMD} -e 's,#!/usr/bin/perl,#!${PERL},' \
		${WRKSRC}/src/lib/Gitolite/Hooks/*.pm

do-build:
	echo "${GH_TAGNAME}" > ${WRKSRC}/src/VERSION
	${MKDIR} ${WRKSRC}/lib
	${MV} ${WRKSRC}/src/lib/Gitolite ${WRKSRC}/lib/
	${RMDIR} ${WRKSRC}/src/lib
	${MV} ${WRKSRC}/check-g2-compat ${WRKSRC}/src/
	${MV} ${WRKSRC}/convert-gitosis-conf ${WRKSRC}/src/
	${FIND} ${WRKSRC} '(' -name '*.bak' -o -name '*.orig' ')' -delete

do-install:
	(cd ${WRKSRC}/src && ${COPYTREE_BIN} \* ${PREFIX}/libexec/gitolite)
	(cd ${WRKSRC}/lib && ${COPYTREE_SHARE} Gitolite ${PREFIX}/${SITE_PERL_REL}/)
	${RLN} ${PREFIX}/libexec/gitolite/gitolite ${PREFIX}/bin/gitolite

do-install-CONTRIB-on:
	@${MKDIR} ${FAKE_DESTDIR}${DATADIR} ${FAKE_DESTDIR}${PREFIX}/share/vim
	(cd ${WRKSRC}/contrib && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DATADIR})
	${MV} ${FAKE_DESTDIR}${DATADIR}/vim ${FAKE_DESTDIR}${PREFIX}/share/vim/vimfiles

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.markdown ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/CHANGELOG ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
