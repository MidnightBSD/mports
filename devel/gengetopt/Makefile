# Created by: Cyrille Lefevre <clefevre@citeweb.net>

PORTNAME=	gengetopt
PORTVERSION=	2.23
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for generating a C function which parses command line arguments

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		makeinfo tar:xz

GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=yes

CFLAGS+=	-D_GL_SYSTEM_GETOPT

INSTALL_WRKSRC=	${WRKSRC}/src

PORTDOCS=	*
PORTEXAMPLES=	*
INFO=		gengetopt

DOC_EXAMPLES=	README.example cmdline1.c cmdline1.h cmdline2.c cmdline2.h \
		main1.cc main2.c multiple_example.c sample1.ggo sample2.ggo
TESTS_EXAMPLES=	test_manual_help.c test_manual_help_cmd.c \
		test_manual_help_cmd.ggo test_manual_help_cmd.h

OPTIONS_DEFINE=	DOCS EXAMPLES

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/${PORTNAME}.1 \
		${MAN1PREFIX}/man/man1/
	@${MKDIR} ${PREFIX}/${INFO_PATH}
	${INSTALL_DATA} ${WRKSRC}/doc/${PORTNAME}.info \
		${PREFIX}/${INFO_PATH}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} AUTHORS ChangeLog NEWS \
		README THANKS TODO doc/index.html doc/gengetopt.html \
		${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
.for e in ${DOC_EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/doc/${e} ${FAKE_DESTDIR}${EXAMPLESDIR}
.endfor
.for e in ${TESTS_EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/tests/${e} ${FAKE_DESTDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
