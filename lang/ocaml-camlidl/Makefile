PORTNAME=	camlidl
PORTVERSION=	1.05
CATEGORIES=	lang
MASTER_SITES=	http://caml.inria.fr/distrib/bazar-ocaml/
PKGNAMEPREFIX=	ocaml-
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}-${PORTVERSION}.doc.html.tar.gz
EXTRACT_ONLY=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stub code generator for using C/C++ libraries from OCaml

LICENSE=	lgpl lgpl2.1
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_OCAML=	yes

MAKE_JOBS_UNSAFE=	yes

NO_TEST=	yes

DOCSDIR=	${PREFIX}/share/doc/ocaml/${PORTNAME}

OPTIONS_DEFINE=	DOCS

post-extract:
	@${REINPLACE_CMD} -e "s,^\(OCAMLLIB=\).*,\1${FAKE_DESTDIR}${PREFIX}/lib/ocaml,g" \
		-e "s,^\(BINDIR=\).*,\1${FAKE_DESTDIR}${PREFIX}/bin,g" \
		-e "s,^CFLAGS=.*,#\&,g" \
		-e "s,^\(CPP=\).*,\1/usr/bin/cpp,g" \
		${WRKSRC}/config/Makefile.unix

	@${REINPLACE_CMD} -e \
		"/^install/,/^$$/s,\([ \t]*\)cp,\1${INSTALL_SCRIPT},g" \
		-e 's,$$(OCAMLC),& -warn-error -a,' \
		${WRKSRC}/compiler/Makefile

	@${REINPLACE_CMD} -e \
		"/^install/,/^$$/s,\([ \t]*\)cp,\1${INSTALL_DATA},g" \
		${WRKSRC}/lib/Makefile ${WRKSRC}/runtime/Makefile.unix

	@${LN} -sf ${WRKSRC}/config/Makefile.unix ${WRKSRC}/config/Makefile

pre-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/ocaml/caml

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${GZCAT} ${_DISTDIR}/${PORTNAME}-${PORTVERSION}.doc.html.tar.gz \
		| ${TAR} -C ${FAKE_DESTDIR}${DOCSDIR} -xf -

.include <bsd.port.mk>
