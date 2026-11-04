PORTNAME=	ddskk
DISTVERSION=	17.1.20230702
PORTREVISION=	5
CATEGORIES=	japanese elisp
PKGNAMESUFFIX=	${EMACS_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Kana to Kanji conversion program on Emacsen
WWW=		http://openlab.ring.gr.jp/skk/ddskk.html

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		emacs

USE_GITHUB=	yes
GH_ACCOUNT=	skk-dev
GH_TAGNAME=	8c47f46

MAKE_ARGS=	PREFIX="${FAKE_DESTDIR}${TRUE_PREFIX}" \
		SKK_LISPDIR="${FAKE_DESTDIR}${TRUE_PREFIX}/${SKK_LISPDIR}" \
		SKK_INFODIR="${FAKE_DESTDIR}${TRUE_PREFIX}/${INFO_PATH}"
ALL_TARGET=	elc info
NO_ARCH=	yes

INFO=		skk
PORTDOCS=	AUTHORS.ja CODENAME.ja Contributors Development.ja.org \
		FAQ.ja NEWS.ja README.ccc.org history.md
PORTEXAMPLES=	dot.emacs dot.skk

SKK_LISPDIR=	${EMACS_VERSION_SITE_LISPDIR}/skk

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
	@${REINPLACE_CMD} -e \
		'/skk-tut-file/s|@TUT@|${PREFIX}/share/skk/SKK.tut|' \
		${WRKSRC}/skk-setup.el.in

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/READMEs/ && ${INSTALL_DATA} ${PORTDOCS} \
		${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/etc/ && ${INSTALL_DATA} ${PORTEXAMPLES} \
		${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
