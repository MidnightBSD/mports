PORTNAME=	slime
DISTVERSIONPREFIX=	v
DISTVERSION=	2.26.1-9
DISTVERSIONSUFFIX=	-gf368e22a
CATEGORIES=	editors elisp
PKGNAMESUFFIX=	${EMACS_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Superior Lisp Interaction Mode for Emacs
WWW=		https://common-lisp.net/project/slime/

LICENSE=	publicdom

BUILD_DEPENDS=	texinfo>=5.2:print/texinfo

USES=		emacs gmake
USE_GITHUB=	yes

ALL_TARGET=	all contrib-compile doc-slime.info
INFO=		slime
NO_ARCH=	yes
PORTDOCS=	CONTRIBUTING.md NEWS PROBLEMS README.md
SUB_FILES=	pkg-message
SUB_LIST=	SLIME_LISPDIR="${SLIME_LISPDIR}"

OPTIONS_DEFINE=	DOCS

SLIME_LISPDIR=	${PREFIX}/${EMACS_VERSION_SITE_LISPDIR}/slime

do-install:
	@${MKDIR} ${SLIME_LISPDIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${SLIME_LISPDIR} \
		"! ( -name CONTRIBUTING.md -o -name NEWS -o -name PROBLEMS \
		-o -name README.md -o -name Makefile -o -name doc \
		-o -path \./doc/* )")

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${INSTALL_WRKSRC}/contrib/README.md \
		${FAKE_DESTDIR}${DOCSDIR}/README-contrib.md
	(cd ${INSTALL_WRKSRC}/doc && ${INSTALL_DATA} slime-refcard.pdf \
		slime-small.pdf ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
