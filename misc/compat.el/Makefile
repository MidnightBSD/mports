PORTNAME=	compat.el
DISTVERSION=	29.1.4.4
CATEGORIES=	misc elisp
PKGNAMESUFFIX=	${EMACS_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compatibility library for Emacs Lisp
WWW=		https://github.com/emacs-compat/compat

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		emacs gmake makeinfo
USE_GITHUB=	yes
GH_ACCOUNT=	emacs-compat
GH_PROJECT=	compat

ALL_TARGET=	all compat.info

NO_ARCH=	yes

#INFO=		compat
PORTDOCS=	NEWS.org README.md

OPTIONS_DEFINE=	DOCS

ELISP_FILES=	compat-25.el compat-25.elc compat-26.el compat-26.elc \
		compat-27.el compat-27.elc compat-28.el compat-28.elc \
		compat-29.el compat-29.elc compat-macs.el compat.el compat.elc

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${EMACS_VERSION_SITE_LISPDIR}/compat
	${INSTALL_DATA}  ${ELISP_FILES:C/^/${WRKSRC}\//} \
		${STAGEDIR}${PREFIX}/${EMACS_VERSION_SITE_LISPDIR}/compat
	${INSTALL_DATA} ${WRKSRC}/*.info ${STAGEDIR}${PREFIX}/${INFO_PATH}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:C/^/${WRKSRC}\//} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
