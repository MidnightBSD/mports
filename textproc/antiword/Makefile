# Created by: Yen-Ming Lee <leeym@FreeBSD.org>

PORTNAME=	antiword
PORTVERSION=	0.37
CATEGORIES=	textproc
MASTER_SITES=	http://www.winfield.demon.nl/linux/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Application for displaying Microsoft(R) Word documents

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/Docs/COPYING

BUILD_DEPENDS=	${LOCALBASE}/share/ghostscript/fonts/n022003l.afm:print/gsfonts
RUN_DEPENDS=	${LOCALBASE}/share/ghostscript/fonts/n022003l.afm:print/gsfonts

USES=		cpe gmake perl5
CPE_VENDOR=	antiword_project
USE_PERL5=	build
MAKE_JOBS_UNSAFE=yes
INSTALL_TARGET=	global_install

PORTDOCS=	ChangeLog Emacs Exmh FAQ History Mozilla Mutt Netscape \
		QandA ReadMe antiword.1 antiword.man antiword.php testdoc.doc

OPTIONS_DEFINE=	DOCS DEBUG

DEBUG_CFLAGS=		-DDEBUG
DEBUG_CFLAGS_OFF=	-DNDEBUG

post-patch:
	@${REINPLACE_CMD} -E 's,/usr/share,${LOCALBASE}/share,g; s,fonts2,fonts,' ${WRKSRC}/Unix-only/fontinfo.pl
	@${REINPLACE_CMD} -E 's|LD|CC|g; /^(CC|CFLAGS|OPT)/d; s,/usr/share,${PREFIX}/share,g; s|/usr/local/bin|${PREFIX}/bin|g' ${WRKSRC}/Makefile.Linux
	@${REINPLACE_CMD} -E 's,/usr/share,${PREFIX}/share,g' ${WRKSRC}/antiword.h

post-install:
	${INSTALL_MAN} ${WRKSRC}/Docs/antiword.1 ${STAGEDIR}${MANPREFIX}/man/man1

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/Docs && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
