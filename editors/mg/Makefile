PORTNAME=	mg
DISTVERSION=	20241008
PORTEPOCH=	1
CATEGORIES=	editors
MASTER_SITES=	https://hydrus.org.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small, fast Emacs-like editor
WWW=		https://man.openbsd.org/mg

LICENSE=	publicdom

FLAVORS=		dynamic static
FLAVOR?=		${FLAVORS:[1]}
static_PKGNAMESUFFIX=	-static

USES=		ncurses uidfix

.if ${FLAVOR} == static
COMMENT+=	(rescue(8) version)
MAKE_ARGS+=	NO_SHARED=yes
PLIST_FILES=	/rescue/mg
.else
PLIST_FILES=	bin/mg \
		share/man/man1/mg.1.gz
PORTDOCS=	README tutorial
OPTIONS_DEFINE=	DOCS
.endif

MAKE_ARGS+=	BINDIR=${PREFIX}/bin \
		MANDIR=${PREFIX}/share/man/man \
		NCURSESINC=${NCURSESINC} \
		NCURSESLIB=${NCURSESLIB}

.if ${FLAVOR} == static
do-install:
	@${MKDIR} ${FAKE_DESTDIR}/rescue
	${INSTALL_PROGRAM} ${WRKSRC}/mg ${FAKE_DESTDIR}/rescue
.else
post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}
.endif

.include <bsd.port.mk>
