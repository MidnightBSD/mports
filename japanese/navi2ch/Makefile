PORTNAME=	navi2ch
PORTVERSION=	2.0.0.d
PORTREVISION=	25
PORTEPOCH=	1
CATEGORIES=	japanese www elisp
PKGNAMESUFFIX=	${EMACS_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	2ch.net and 2ch-like BBS navigator for Emacsen
WWW=		https://navi2ch.sourceforge.net

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${LOCALBASE}/sbin/2chproxy.pl:japanese/p5-2chproxy

USES=		emacs
USE_GITHUB=	yes
GH_ACCOUNT=	naota
GH_TAGNAME=	faebfd1

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	EMACS="${EMACS_CMD}"
CONFIGURE_ARGS=	--with-lispdir=${PREFIX}/${LISPDIR}/${PORTNAME}
PLIST_SUB=	LISPDIR=${LISPDIR}
PORTDOCS=	${PORTDOC_FILES} contrib

INFO=		navi2ch

PORTDOC_FILES=	ChangeLog README TODO
PORTDOC_LISPS=	gikope.el navi2ch-logo.el navi2ch-migemo.el
LISPDIR=	${EMACS_VERSION_SITE_LISPDIR}

OPTIONS_DEFINE=	DOCS X11
OPTIONS_DEFAULT=X11
X11_RUN_DEPENDS=${LOCALBASE}/share/fonts/mona/monak12.pcf.gz:japanese/font-mona

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && \
	    ${INSTALL_DATA} ${PORTDOC_FILES} ${FAKE_DESTDIR}${DOCSDIR}
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/contrib
	cd ${WRKSRC}/contrib && \
	    ${INSTALL_DATA} ${PORTDOC_LISPS} ${FAKE_DESTDIR}${DOCSDIR}/contrib

.include <bsd.port.mk>
