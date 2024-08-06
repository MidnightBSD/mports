PORTNAME=	fish
DISTVERSION=	3.7.1
CATEGORIES=	shells
MASTER_SITES=	https://github.com/fish-shell/fish-shell/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User friendly command line shell
WWW=		https://fishshell.com/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpcre2-32.so:devel/pcre2

# The python dependency is only needed by shebangfix.  At runtime python is
# only needed by some optional scripts that aren't in PATH.
USES=		cmake compiler:c++11-lang cpe localbase ncurses python:env \
		shebangfix tar:xz
CPE_VENDOR=	fishshell
SHEBANG_FILES=	share/tools/*.py share/tools/web_config/webconfig.py

# sphinx stuff seems to be racy
MAKE_JOBS_UNSAFE=	yes

CONFLICTS_INSTALL=	comms/mlan3

MANDIRS=	${DATADIR}/man

PORTDOCS=	*

OPTIONS_DEFINE=		DOCS MANPAGES NLS
OPTIONS_DEFAULT=	MANPAGES NLS
OPTIONS_SUB=		yes

DOCS_BUILD_DEPENDS=	sphinx-build:textproc/py-sphinx@${PY_FLAVOR}
DOCS_CMAKE_BOOL=	BUILD_DOCS
DOCS_VARS=		MAKE_JOBS_UNSAFE=yes

NLS_USES=	gettext
NLS_CMAKE_BOOL=	WITH_GETTEXT

.include <bsd.port.pre.mk>

.if ${NCURSESBASE:M${LOCALBASE}}
CMAKE_ARGS+=	-DCURSES_NEED_NCURSES=TRUE
.endif

post-install:
	@${MV} ${ETCDIR}/config.fish ${ETCDIR}/config.fish.sample

post-fake-DOCS-on:
	@${RM} ${FAKE_DESTDIR}${DOCSDIR}/.buildinfo

post-install-DOCS-off:
	# required because fish always installs documentation
	@${ECHO_MSG} "====> DOCS disable; removing documentation"
	@${RM} -r ${FAKE_DESTDIR}${DOCSDIR}

post-install-MANPAGES-off:
	# required because fish always installs manual pages
	@${ECHO_MSG} "====> MANPAGES disable; removing manual pages"
	for dir in ${MANDIRS:S/^/${FAKE_DESTDIR}/} ; do \
		${FIND} $$dir -type f -delete ; \
	done
	@${RM} -r ${FAKE_DESTEDIR}${DATADIR}/man

.include <bsd.port.post.mk>
